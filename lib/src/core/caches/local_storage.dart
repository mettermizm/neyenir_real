import 'package:shared_preferences/shared_preferences.dart';

/// It's a wrapper around the SharedPreferences class that makes it easier to use
class LocalStorageManager {
  SharedPreferences? _preferences;

  Future<SharedPreferences> get prefs async {
    if (_preferences != null) return _preferences!;
    _preferences = await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<void> setStringValue(dynamic key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String? getStringValue(dynamic key) => _preferences!.getString(key.toString());

  Future<void> setIntValue(dynamic key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }

  int? getIntValue(dynamic key) => _preferences!.getInt(key.toString());

  Future<void> setBoolValue(dynamic key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  bool getBoolValue(dynamic key) => _preferences!.getBool(key.toString()) ?? false;

  Future<void> removeKey({required String key}) async => await _preferences!.remove(key);

  clearAllValues() async => await _preferences!.clear();
}
