import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static Padding paddingTop = const Padding(
    padding: EdgeInsets.only(top: 36),
  );
  static Padding paddingLeft = const Padding(
    padding: EdgeInsets.only(left: 12),
  );
  static TextStyle textStyle = const TextStyle(fontSize: 24.0);

  static double calculateBMI(double height, double weight, int unit) {
    double result;
    if (unit == 0) {
      result = (weight / height / height) * 10000;
    } else {
      result = (weight / height / height) * 703;
    }
    return result;
  }

  static void saveSettings(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unit', value);
  }

  static Future<int> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int result = prefs.getInt('unit') ?? 0;
    return result;
  }
}
