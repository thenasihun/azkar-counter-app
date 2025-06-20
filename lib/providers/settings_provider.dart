import 'package:flutter/material.dart';
import 'package:azkar_counter/services/settings_service.dart';

class SettingsProvider with ChangeNotifier {
  final SettingsService _settingsService = SettingsService();
  
  bool _isSoundOn = true;

  bool get isSoundOn => _isSoundOn;

  SettingsProvider() {
    loadSettings();
  }

  // Load the saved setting when the app starts
  void loadSettings() async {
    _isSoundOn = await _settingsService.getSoundSetting();
    notifyListeners();
  }

  // Toggles the sound setting and saves the preference
  void toggleSound() {
    _isSoundOn = !_isSoundOn;
    _settingsService.setSoundSetting(_isSoundOn);
    notifyListeners();
  }
}
