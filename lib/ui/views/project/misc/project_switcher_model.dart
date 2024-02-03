/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/gen/assets.gen.dart';

class ProjectSwitcherModel {
  final String name;
  final String icon;

  ProjectSwitcherModel({this.name = '', this.icon = ''});
}

final List<ProjectSwitcherModel> displays = [
  ProjectSwitcherModel(name: 'List', icon: Assets.images.icons.list.path),
  ProjectSwitcherModel(name: 'Board', icon: Assets.images.icons.columns.path),
];
