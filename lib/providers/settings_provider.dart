import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  static const String _tapSoundKey = 'tap_sound_on';
  static const String _targetSoundKey = 'target_sound_on';
  
  bool _isTapSoundOn = true;
  bool _isTargetSoundOn = true;

  bool get isTapSoundOn => _isTapSoundOn;
  bool get isTargetSoundOn => _isTargetSoundOn;

  SettingsProvider() {
    loadSoundSettings();
  }

  void loadSoundSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isTapSoundOn = prefs.getBool(_tapSoundKey) ?? true;
    _isTargetSoundOn = prefs.getBool(_targetSoundKey) ?? true;
    notifyListeners();
  }

  void toggleTapSound(bool isOn) async {
    _isTapSoundOn = isOn;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_tapSoundKey, isOn);
    notifyListeners();
  }

  void toggleTargetSound(bool isOn) async {
    _isTargetSoundOn = isOn;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_targetSoundKey, isOn);
    notifyListeners();
  }

  // New function to handle restoring settings from a backup file
  void restoreSoundSettings(bool tapSound, bool targetSound) {
    // Call the existing toggle methods to update the state and save to preferences
    toggleTapSound(tapSound);
    toggleTargetSound(targetSound);
  }
}
