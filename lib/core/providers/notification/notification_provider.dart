/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }

  bool _empty = true;
  bool get empty => _empty;
  set empty(bool value) {
    _empty = value;
    notifyListeners();
  }

  final ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;
}
