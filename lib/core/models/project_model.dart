/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import 'user_model.dart';

class ProjectModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String image;
  final String url;
  final String access;
  final List<UserModel> participants;
  final double progress;

  const ProjectModel(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.image = '',
      this.url = '',
      this.access = '',
      this.participants = const [],
      this.progress = 0});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        url: json['url'],
        access: json['access'],
        participants: json['participants'],
        progress: json['progress']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'url': url,
      'access': access,
      'participants': participants,
      'progress': progress
    };
  }

  @override
  List<Object?> get props => [id, name, description, image, url, access, participants, progress];
}
