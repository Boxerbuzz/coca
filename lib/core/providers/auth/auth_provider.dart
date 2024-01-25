/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../ui/coca.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void setAuth(bool value) {
    _isAuth = value;
    notifyListeners();
  }

  CustomCheckboxEnum _tcAgreement = CustomCheckboxEnum.checked;

  CustomCheckboxEnum get tcAgreement => _tcAgreement;

  set tcAgreement(CustomCheckboxEnum value) {
    _tcAgreement = value;
    notifyListeners();
  }
}
