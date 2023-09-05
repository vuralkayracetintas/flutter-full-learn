import 'package:flutter_full_learn/202/cache/share_not_initialize.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager() {
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPrefences() {
    if (preferences == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPrefences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPrefences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringList(SharedKeys key) {
    _checkPrefences();
    preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkPrefences();
    return preferences?.getString(key.name);
  }

  List<String>? getStrings(SharedKeys key) {
    _checkPrefences();
    return preferences?.getStringList(key.name);
  }

  Future<bool> removeString(SharedKeys key) async {
    _checkPrefences();
    return (await preferences?.remove(key.name) ?? false);
  }
}
