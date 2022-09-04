import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencies {
  static SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
