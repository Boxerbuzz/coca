/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../../../../core/models/task_model.dart';
import 'my_task_model.dart';

final List<MyTaskModel> data = [
  const MyTaskModel(title: 'Today', tasks: [
    TaskModel(
        id: '1',
        description: '',
        title: 'Iterate User Experience (UX) For Unreal Stage App',
        isCompleted: true,
        date: '28 Jan, 2024'),
    TaskModel(
        id: '2',
        description: '',
        title: 'Visualize Compression Module With @Boxerbuzz',
        isCompleted: true,
        date: '28 Jan, 2024'),
    TaskModel(
        id: '3',
        description: '',
        title: 'Meet with Internal TwinMotion team',
        isCompleted: false,
        date: '28 Jan, 2024'),
  ]),
  const MyTaskModel(
    title: 'Next',
    tasks: [
      TaskModel(
          id: '4',
          title: 'Define Problem with Client',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
          date: 'Saturday, 12:30 PM',
          status: 'In Progress',
          isCompleted: false),
      TaskModel(
          id: '5',
          title: 'Create Wireframe and User Flow',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
          date: 'Monday, 02:00 PM',
          status: 'In Progress',
          isCompleted: false),
      TaskModel(
          id: '6',
          title: 'Visual High Fidelity Design',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
          date: 'Tuesday, 01:20 PM',
          status: 'In Progress',
          isCompleted: false),
      TaskModel(
          id: '7',
          description: '',
          title: 'Walkthrough Design Files with @Erik and team',
          isCompleted: true,
          date: '28 Jan, 2024'),
      TaskModel(
          id: '8',
          description: '',
          title: 'Define Problems Statement with @Mike #TwinMotion',
          isCompleted: true,
          date: '28 Jan, 2024'),
    ],
  ),
  const MyTaskModel(title: 'Overdue', tasks: [])
];
