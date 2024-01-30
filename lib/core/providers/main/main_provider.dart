/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class MainProvider with ChangeNotifier {
  ///page index for the main screen.
  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }

  /// List of screens to be shown on the main screen and accessed via the bottom app bar.
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProjectScreen(),
    Container(),
    const MessageScreen(),
    const ProfileScreen()
  ];
  List<Widget> get screens => _screens;

  /// An instance of the currently selected/active workspace.
  WorkspaceModel? _workspace;
  WorkspaceModel? get workspace => _workspace;
  set workspace(WorkspaceModel? value) {
    _workspace = value;
    notifyListeners();
  }

  List<WorkspaceModel> _workspaces = [];
  List<WorkspaceModel> get workspaces => _workspaces;
  set workspaces(List<WorkspaceModel> value) {
    _workspaces = value;
    notifyListeners();
  }

  UserModel? _user = userData;
  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }
}
