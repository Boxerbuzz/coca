/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  int _page = 0;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }
}
