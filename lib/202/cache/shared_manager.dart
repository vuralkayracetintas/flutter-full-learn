import 'package:flutter_full_learn/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? _prefs;

  SharedManager() {
    init();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (_prefs == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await _prefs?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await _prefs?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) {
    _checkPreferences();
    return _prefs?.getStringList(key.name);
  }

  String? getStringData(SharedKeys key) {
    _checkPreferences();
    return _prefs?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return await _prefs?.remove(key.name) ?? false;
  }
}
