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

  // Loads both sound preferences from device storage
  void loadSoundSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isTapSoundOn = prefs.getBool(_tapSoundKey) ?? true;
    _isTargetSoundOn = prefs.getBool(_targetSoundKey) ?? true;
    notifyListeners();
  }

  // Toggles and saves the tap sound preference
  void toggleTapSound(bool isOn) async {
    _isTapSoundOn = isOn;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_tapSoundKey, isOn);
    notifyListeners();
  }

  // Toggles and saves the target reached sound preference
  void toggleTargetSound(bool isOn) async {
    _isTargetSoundOn = isOn;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_targetSoundKey, isOn);
    notifyListeners();
  }
}
