import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    if (_preferences == null) {
      throw Exception('SharedPreferences not initialized');
    }
    return _preferences!;
  }

  static Future<void> setString(String key, String value) async {
    await instance.setString(key, value);
  }

  static String? getString(String key) {
    return instance.getString(key);
  }

  static Future<void> remove(String key) async {
    await instance.remove(key);
  }

  // Add more methods as needed
}
