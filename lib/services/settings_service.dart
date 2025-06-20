import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _soundKey = 'sound_on';

  // Saves the sound preference (true for on, false for off)
  Future<void> setSoundSetting(bool isOn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_soundKey, isOn);
  }

  // Retrieves the saved sound preference. Defaults to true (on).
  Future<bool> getSoundSetting() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_soundKey) ?? true;
  }
}
