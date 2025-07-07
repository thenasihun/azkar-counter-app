import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  // Keys for SharedPreferences
  static const String _tapSoundKey = 'tap_sound_on';
  static const String _targetSoundKey = 'target_sound_on';
  static const String _transliterationKey = 'show_transliteration';
  static const String _meaningKey = 'show_meaning';

  // State variables
  bool _isTapSoundOn = true;
  bool _isTargetSoundOn = true;
  bool _showTransliteration = false; // Default OFF
  bool _showMeaning = true;       // Default ON

  // Getters for UI
  bool get isTapSoundOn => _isTapSoundOn;
  bool get isTargetSoundOn => _isTargetSoundOn;
  bool get showTransliteration => _showTransliteration;
  bool get showMeaning => _showMeaning;

  SettingsProvider() {
    loadSettings();
  }

  // Load all settings from device storage
  void loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isTapSoundOn = prefs.getBool(_tapSoundKey) ?? true;
    _isTargetSoundOn = prefs.getBool(_targetSoundKey) ?? true;
    _showTransliteration = prefs.getBool(_transliterationKey) ?? false;
    _showMeaning = prefs.getBool(_meaningKey) ?? true;
    notifyListeners();
  }

  // --- Toggle Methods ---
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

  void toggleShowTransliteration(bool isOn) async {
    _showTransliteration = isOn;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_transliterationKey, isOn);
    notifyListeners();
  }

  void toggleShowMeaning(bool isOn) async {
    _showMeaning = isOn;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_meaningKey, isOn);
    notifyListeners();
  }

  // Restore all settings from a backup file
  void restoreAllSettings(
      {required bool tapSound,
      required bool targetSound,
      required bool showTranslit,
      required bool showMeaning}) {
    toggleTapSound(tapSound);
    toggleTargetSound(targetSound);
    toggleShowTransliteration(showTranslit);
    toggleShowMeaning(showMeaning);
  }
}
