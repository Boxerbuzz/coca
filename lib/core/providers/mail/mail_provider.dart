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

  MailPageModel _mailPage = const MailPageModel('Inbox', Offset.zero, MailPageEnum.inbox);
  MailPageModel get mailPage => _mailPage;
  set mailPage(MailPageModel page) {
    _mailPage = page;
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
