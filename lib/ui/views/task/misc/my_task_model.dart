/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import '../../../../core/models/task_model.dart';

class MyTaskModel extends Equatable {
  final String title;
  final List<TaskModel> tasks;

  const MyTaskModel({this.title = '', this.tasks = const []});

  int get taskCount => tasks.length;

  @override
  List<Object?> get props => [title, tasks];
}
