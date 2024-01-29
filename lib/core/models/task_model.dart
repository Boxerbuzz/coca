/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import 'user_model.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String date;
  final String status;
  final bool isCompleted;
  final UserModel? assignee;
  final UserModel? assigner;

  const TaskModel(
      {this.id = '',
      this.title = '',
      this.description = '',
      this.date = '',
      this.status = '',
      this.isCompleted = false,
      this.assignee,
      this.assigner});

  @override
  List<Object> get props => [id, title, description, date, status, isCompleted];
}
