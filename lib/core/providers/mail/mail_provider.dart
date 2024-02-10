/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class MailProvider extends ChangeNotifier {
  MailModel? _selectedMail;
  MailModel? get selectedMail => _selectedMail;
  set selectedMail(MailModel? mail) {
    _selectedMail = mail;
    notifyListeners();
  }

  MailPageEnum _mailPage = MailPageEnum.inbox;
  MailPageEnum get mailPage => _mailPage;
  set mailPage(MailPageEnum page) {
    _mailPage = page;
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  MailDrawerState _drawerState = MailDrawerState.close;
  MailDrawerState get drawerState => _drawerState;
  set drawerState(MailDrawerState state) {
    _drawerState = state;
    notifyListeners();
  }

  void toggleDrawer() {
    _drawerState = _drawerState == MailDrawerState.open ? MailDrawerState.close : MailDrawerState.open;
    notifyListeners();
  }
}
