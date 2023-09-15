import 'package:shared_preferences/shared_preferences.dart';

class SharedManage {
  SharedPreferences? _prefs;

  SharedManager() {
    init();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _prefs?.setString('counter', value);
  }

  Future<String?> getString(String key) async {
    return _prefs?.getString('counter');
  }

  Future<bool> removeItem(String key) async {
    return await _prefs?.remove('counter') ?? false;
  }
}
