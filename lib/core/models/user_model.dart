/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final String createdAt;
  final String updatedAt;

  const UserModel(
      {this.id = '',
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.image = '',
      this.createdAt = '',
      this.updatedAt = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        image: json['image'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  @override
  List<Object?> get props => [id, firstName, lastName, email, image, createdAt, updatedAt];
}
