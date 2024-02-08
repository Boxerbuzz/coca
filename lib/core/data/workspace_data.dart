/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../../coca.dart';

final List<WorkspaceModel> workspacesData = [
  WorkspaceModel(
      id: '1',
      name: 'San Designs',
      description: '#1 multi award winning design agency.',
      image: 'assets/images/logo/zan.svg',
      participants: users.getRange(5, 10).toList()),
  WorkspaceModel(
      id: '2',
      name: 'Suteki Tech',
      description: "World class software development agency taking startup's and businesses from zero to hero.",
      image: 'assets/images/logo/suteki.svg',
      participants: users.getRange(10, 20).toList()),
  WorkspaceModel(
      id: '3',
      name: 'Unreal Engine',
      description: "#1 most innovative startup for 2024.",
      image: Assets.images.logo.brandUnrealEngine,
      participants: users.getRange(0, 10).toList()),
];
