import 'package:azkar_counter/services/backup_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';
import 'package:azkar_counter/providers/settings_provider.dart';
import 'package:azkar_counter/providers/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  void _showResetConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset All-Time Stats'),
          content: const Text(
              'Are you sure you want to reset the "Total" count for ALL Azkar? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Reset',
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
              onPressed: () {
                Provider.of<AzkarProvider>(context, listen: false)
                    .resetAllTotalCounts();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All-time stats have been reset.'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Settings & About'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionCard(
              context: context,
              title: 'Preferences',
              items: [
                _buildThemeSelector(context),
                Consumer<SettingsProvider>(builder: (context, settings, child) {
                  return _buildSettingsItem(
                    context,
                    'Tap Sound',
                    settings.isTapSoundOn,
                    settings.toggleTapSound,
                  );
                }),
                Consumer<SettingsProvider>(builder: (context, settings, child) {
                  return _buildSettingsItem(
                    context,
                    'Target Reached Sound',
                    settings.isTargetSoundOn,
                    settings.toggleTargetSound,
                  );
                }),
                const Divider(),
                // New display preference toggles
                Consumer<SettingsProvider>(builder: (context, settings, child) {
                  return _buildSettingsItem(
                    context,
                    'Show Transliteration',
                    settings.showTransliteration,
                    settings.toggleShowTransliteration,
                  );
                }),
                Consumer<SettingsProvider>(builder: (context, settings, child) {
                  return _buildSettingsItem(
                    context,
                    'Show Meaning',
                    settings.showMeaning,
                    settings.toggleShowMeaning,
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              context: context,
              title: 'Data Management',
              items: [
                ListTile(
                  leading: const Icon(Icons.backup_outlined),
                  title: const Text('Create Backup'),
                  subtitle:
                      const Text('Save all your Azkar and settings to a file.'),
                  onTap: () => BackupService.createBackup(context),
                ),
                ListTile(
                  leading: const Icon(Icons.restore_page_outlined),
                  title: const Text('Restore from Backup'),
                  subtitle:
                      const Text('Load your data from a backup file.'),
                  onTap: () => BackupService.restoreFromBackup(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              context: context,
              title: 'Danger Zone',
              items: [
                ListTile(
                  title: Text('Reset All-Time Stats',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error)),
                  subtitle:
                      const Text('Resets the "Total" count for every Azkar.'),
                  onTap: () => _showResetConfirmationDialog(context),
                  trailing: Icon(Icons.warning_amber_rounded,
                      color: Theme.of(context).colorScheme.error),
                )
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(context),
            const SizedBox(height: 20),
            _buildSectionCard(
              context: context,
              title: 'Connect with Us',
              items: [
                _buildLinkItem(context, '@Nasihun on Whatsapp', () => _launchURL('https://www.whatsapp.com/channel/0029VaCXfSF1NCrXOeyGBk3l')),
                _buildLinkItem(context, '@thenasihun on Instagram', () => _launchURL('https://instagram.com/thenasihun')),
                _buildLinkItem(context, 'thenasihun@gmail.com', () => _launchURL('mailto:thenasihun@gmail.com')),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _launchURL('https://nasihun.com'),
              child: Text(
                'nasihun.com',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSelector(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text('App Theme',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface)),
          ),
          SegmentedButton<ThemeMode>(
            segments: const <ButtonSegment<ThemeMode>>[
              ButtonSegment<ThemeMode>(
                  value: ThemeMode.light,
                  label: Text('Light'),
                  icon: Icon(Icons.light_mode)),
              ButtonSegment<ThemeMode>(
                  value: ThemeMode.dark,
                  label: Text('Dark'),
                  icon: Icon(Icons.dark_mode)),
              ButtonSegment<ThemeMode>(
                  value: ThemeMode.system,
                  label: Text('System'),
                  icon: Icon(Icons.brightness_auto)),
            ],
            selected: {themeProvider.themeMode},
            onSelectionChanged: (Set<ThemeMode> newSelection) {
              themeProvider.setTheme(newSelection.first);
            },
            style: SegmentedButton.styleFrom(
                selectedBackgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                selectedForegroundColor: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, String text, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(text,
          style: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.onSurface)),
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildSectionCard(
      {required BuildContext context,
      required String title,
      required List<Widget> items}) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const Divider(height: 24),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildLinkItem(
      BuildContext context, String text, VoidCallback onTap) {
    return ListTile(
      title: Text(text,
          style:
              TextStyle(color: Theme.of(context).colorScheme.onSurface)),
      trailing: Icon(Icons.open_in_new,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          size: 20),
      onTap: onTap,
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      elevation: 0,
       color: Theme.of(context).cardColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
         side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              "عداد الأذكار",
              style: TextStyle(
                  fontFamily: 'NotoNaskhArabic',
                  fontSize: 42,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              "Azkar Counter",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 4),
            Text("Version 1.1.0",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7))),
            const SizedBox(height: 20),
            Text(
              'A simple and beautiful app to help you maintain your daily azkar and remember Allah throughout the day.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.7),
                  height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
