import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  Future saveList(String key, String value) async {
    final p = await pref;
    return await p.setString(key, value);
  }

  Future<String> getList() async {
    final p = await pref;
    return p.getString("suggestions");
  }
}
