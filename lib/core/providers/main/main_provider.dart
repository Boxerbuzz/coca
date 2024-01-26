/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/coca.dart';
import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  ///page index for the main screen.
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProjectScreen(),
    Container(),
    const MessageScreen(),
    const ProfileScreen(),
  ];
  List<Widget> get screens => _screens;
}
