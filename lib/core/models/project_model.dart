/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_board/appflowy_board.dart';

import 'task_model.dart';
import 'user_model.dart';

class ProjectModel extends AppFlowyGroupItem {
  final String name;
  final String description;
  final String image;
  final String url;
  final String access;
  final List<UserModel> participants;
  final double progress;
  final String uid;
  final List<TaskModel> tasks;
  final bool hasAttachments;
  final List<String> attachments;

  ProjectModel(
      {this.uid = '',
      this.name = '',
      this.description = '',
      this.image = '',
      this.url = '',
      this.access = '',
      this.participants = const [],
      this.progress = 0,
      this.tasks = const [],
      this.hasAttachments = false,
      this.attachments = const []});

  @override
  String get id => uid;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        uid: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        url: json['url'],
        access: json['access'],
        participants: json['participants'],
        progress: json['progress'],
        tasks: json['tasks'],
        hasAttachments: json['hasAttachments'],
        attachments: json['attachments']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': id,
      'name': name,
      'description': description,
      'image': image,
      'url': url,
      'access': access,
      'participants': participants,
      'progress': progress,
      'tasks': tasks,
      'hasAttachments': hasAttachments,
      'attachments': attachments
    };
  }
}
