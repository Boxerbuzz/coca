/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../../ui/coca.dart';

final List<WorkspaceModel> workspaceData = [
  WorkspaceModel(
      id: '1',
      name: 'San Designs',
      description: '#1 multi award winning design agency.',
      image: 'assets/images/logo/zan.svg',
      participants: userData.getRange(5, 10).toList()),
  WorkspaceModel(
      id: '2',
      name: 'Suteki Tech',
      description: "World class software development agency taking startup's and businesses from zero to hero.",
      image: 'assets/images/logo/suteki.svg',
      participants: userData.getRange(10, 20).toList()),
  WorkspaceModel(
      id: '3',
      name: 'Coca',
      description: "#1 most innovative startup for 2021.",
      image: 'assets/images/logo/coca.svg',
      participants: userData.getRange(0, 10).toList()),
];
