/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void setAuth(bool value) {
    _isAuth = value;
    notifyListeners();
  }

  bool _tcAgreement = false;

  bool get tcAgreement => _tcAgreement;

  set tcAgreement(bool value) {
    _tcAgreement = value;
    notifyListeners();
  }
}
