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
      // Gather all data from providers
      final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);
      final settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

      // Create a map of all Azkar data
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

      // Create a map for all settings
      final Map<String, dynamic> settingsData = {
        'themeMode': themeProvider.themeMode.index,
        'isTapSoundOn': settingsProvider.isTapSoundOn,
        'isTargetSoundOn': settingsProvider.isTargetSoundOn,
      };

      // Combine everything into a single backup object
      final Map<String, dynamic> backupData = {
        'backupDate': DateTime.now().toIso8601String(),
        'azkarList': azkarData,
        'settings': settingsData,
      };

      // Convert the map to a JSON string
      final String jsonString = jsonEncode(backupData);

      // Generate a default file name
      final String fileName =
          'azkar_counter_backup_${DateFormat('yyyy-MM-dd_HH-mm').format(DateTime.now())}.json';

      // Use `saveFile` which handles permissions automatically by letting the user choose the location.
      final String? result = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file:',
        fileName: fileName,
        bytes: utf8.encode(jsonString),
      );

      // The 'result' will be the path if the file was saved, or null if the user canceled.
      if (result != null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Backup created successfully: $fileName')),
        );
      } else {
        // User canceled the dialog
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

        // Restore Azkar data
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

        // Restore settings data
        final Map<String, dynamic> settingsData = backupData['settings'];
        final ThemeMode themeMode = ThemeMode.values[settingsData['themeMode']];
        final bool isTapSoundOn = settingsData['isTapSoundOn'];
        final bool isTargetSoundOn = settingsData['isTargetSoundOn'];

        // Apply the restored data using providers
        // ignore: use_build_context_synchronously
        Provider.of<AzkarProvider>(context, listen: false)
            .restoreAzkar(restoredAzkar);
        // ignore: use_build_context_synchronously
        Provider.of<ThemeProvider>(context, listen: false).setTheme(themeMode);
        // ignore: use_build_context_synchronously
        Provider.of<SettingsProvider>(context, listen: false)
            .restoreSoundSettings(isTapSoundOn, isTargetSoundOn);

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
