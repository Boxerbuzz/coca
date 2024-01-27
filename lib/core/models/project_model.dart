/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

class ProjectModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final String url;
  final String createdAt;
  final String updatedAt;

  ProjectModel(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.image = '',
      this.url = '',
      this.createdAt = '',
      this.updatedAt = ''});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        url: json['url'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'url': url,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
