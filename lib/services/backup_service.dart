import 'dart:convert';
import 'dart:io';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';
import 'package:azkar_counter/providers/settings_provider.dart';
import 'package:azkar_counter/providers/theme_provider.dart';

class BackupService {
  // --- Create Backup ---
  static Future<void> createBackup(BuildContext context) async {
    try {
      final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);
      final settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

      final List<Map<String, dynamic>> azkarData =
          azkarProvider.azkarList.map((azkar) {
        return {
          'title': azkar.title,
          'arabic': azkar.arabic,
          'meaning': azkar.meaning,
          'dailyCount': azkar.dailyCount,
          'totalCount': azkar.totalCount,
          'isCustom': azkar.isCustom,
          'lastUpdated': azkar.lastUpdated.toIso8601String(),
          'targetCount': azkar.targetCount,
        };
      }).toList();

      // Add the new display preferences to the backup
      final Map<String, dynamic> settingsData = {
        'themeMode': themeProvider.themeMode.index,
        'isTapSoundOn': settingsProvider.isTapSoundOn,
        'isTargetSoundOn': settingsProvider.isTargetSoundOn,
        'showTransliteration': settingsProvider.showTransliteration,
        'showMeaning': settingsProvider.showMeaning,
      };

      final Map<String, dynamic> backupData = {
        'backupDate': DateTime.now().toIso8601String(),
        'azkarList': azkarData,
        'settings': settingsData,
      };

      final String jsonString = jsonEncode(backupData);
      final String fileName =
          'azkar_counter_backup_${DateFormat('yyyy-MM-dd_HH-mm').format(DateTime.now())}.json';

      final String? result = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file:',
        fileName: fileName,
        bytes: utf8.encode(jsonString),
      );

      if (result != null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Backup created successfully: $fileName')),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating backup: $e')),
      );
    }
  }

  // --- Restore from Backup ---
  static Future<void> restoreFromBackup(BuildContext context) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        final File file = File(result.files.single.path!);
        final String jsonString = await file.readAsString();
        final Map<String, dynamic> backupData = jsonDecode(jsonString);

        final List<dynamic> azkarData = backupData['azkarList'];
        final List<AzkarModel> restoredAzkar = azkarData.map((data) {
          return AzkarModel(
            title: data['title'],
            arabic: data['arabic'],
            meaning: data['meaning'],
            dailyCount: data['dailyCount'],
            totalCount: data['totalCount'],
            isCustom: data['isCustom'],
            lastUpdated: DateTime.parse(data['lastUpdated']),
            targetCount: data['targetCount'],
          );
        }).toList();

        final Map<String, dynamic> settingsData = backupData['settings'];
        final ThemeMode themeMode = ThemeMode.values[settingsData['themeMode']];
        final bool isTapSoundOn = settingsData['isTapSoundOn'];
        final bool isTargetSoundOn = settingsData['isTargetSoundOn'];
        // Extract the new display preferences from the backup
        final bool showTransliteration = settingsData['showTransliteration'] ?? false;
        final bool showMeaning = settingsData['showMeaning'] ?? true;

        // ignore: use_build_context_synchronously
        Provider.of<AzkarProvider>(context, listen: false)
            .restoreAzkar(restoredAzkar);
        // ignore: use_build_context_synchronously
        Provider.of<ThemeProvider>(context, listen: false).setTheme(themeMode);
        // ignore: use_build_context_synchronously
        Provider.of<SettingsProvider>(context, listen: false)
            .restoreAllSettings(
          tapSound: isTapSoundOn,
          targetSound: isTargetSoundOn,
          showTranslit: showTransliteration,
          showMeaning: showMeaning,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Backup restored successfully!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error restoring backup: $e')),
      );
    }
  }
}
