import 'package:shared_preferences/shared_preferences.dart';

class SettingConfigRepository {
  static const String _darkmode = "darkmode";

  final SharedPreferences _preferences;

  SettingConfigRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkmode, value);
  }

  bool isDarkMode() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
