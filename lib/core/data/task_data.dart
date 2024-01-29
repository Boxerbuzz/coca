/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../models/task_model.dart';

final List<TaskModel> tasks = [
  const TaskModel(
      id: '1',
      description: '',
      title: 'Iterate User Experience (UX) For Unreal Stage App',
      isCompleted: true,
      date: '28 Jan, 2024'),
  const TaskModel(
      id: '2',
      description: '',
      title: 'Visualize Compression Module With @Boxerbuzz',
      isCompleted: true,
      date: '28 Jan, 2024'),
  const TaskModel(
      id: '3', description: '', title: 'Meet with Internal TwinMotion team', isCompleted: false, date: '28 Jan, 2024'),
  const TaskModel(
      id: '4',
      description: '',
      title: 'Walkthrough Design Files with @Erik and team',
      isCompleted: true,
      date: '28 Jan, 2024'),
];
