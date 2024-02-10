/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../../../../coca.dart';
import 'project_layout_model.dart';

final List<ProjectLayoutModel> layouts = [
  ProjectLayoutModel(id: 1, name: 'List', icon: Assets.images.icons.list),

  /// makeshift item for the gap
  const ProjectLayoutModel(id: 2, name: '', icon: ''),
  ProjectLayoutModel(id: 3, name: 'Board', icon: Assets.images.icons.kanban),
];
