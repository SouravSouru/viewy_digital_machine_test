import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends ChangeNotifier {
  setData(String name, String mobile, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString("name", name);
    await preferences.setString("mobile", mobile);
    await preferences.setString("password", password);
    notifyListeners();
  }

  Future<Map> getSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map savedDetails = {};

    savedDetails["name"] = await preferences.getString("name");
    savedDetails["mobile"] = await preferences.getString("mobile");
    savedDetails["password"] = await preferences.getString("password");
    print(savedDetails);
    notifyListeners();

    return savedDetails;
  }
}
