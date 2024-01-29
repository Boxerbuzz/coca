/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import 'user_model.dart';

class WorkspaceModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String image;
  final String url;
  final String createdAt;
  final String updatedAt;
  final List<UserModel> participants;

  const WorkspaceModel(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.image = '',
      this.url = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.participants = const []});

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      url: json['url'],
      participants:
          json['participants'] != null ? (json['participants'] as List).map((e) => UserModel.fromJson(e)).toList() : [],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'url': url,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'participants': participants.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, name, description, image, url, createdAt, updatedAt, participants];
}
