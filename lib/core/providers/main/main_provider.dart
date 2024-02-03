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

  UserModel? _user = UserModel.fromJson(const {
    "gender": "male",
    "firstName": "Oscar",
    "lastName": "Andersen",
    "email": "oscar.andersen@example.com",
    "username": "brown-dog398",
    "dob": "1981-02-18T20:53:47.767Z",
    "createdAt": "2010-07-02T06:04:54.995Z",
    "phone": "67240172",
    "id": "b0147e45-1853-4f1f-9b32-5a60ab3701b4",
    "image": "https://randomuser.me/api/portraits/men/1.jpg",
    "nat": "DK"
  });
  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }
}
