import 'package:flutter/material.dart';

class LoginContoller extends ChangeNotifier {
  bool isVisiblePassword = true;

  changeVisibility(bool value) {
    if (value == true) {
      isVisiblePassword = false;
    } else {
      isVisiblePassword = true;
    }
    notifyListeners();
  }
}
