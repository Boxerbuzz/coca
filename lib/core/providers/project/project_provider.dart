/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../enums/project_display_enum.dart';

class ProjectProvider extends ChangeNotifier {
  ProjectDisplayEnum _display = ProjectDisplayEnum.board;
  ProjectDisplayEnum get display => _display;
  set display(ProjectDisplayEnum value) {
    _display = value;
    notifyListeners();
  }
}
