/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final String createdAt;
  final String updatedAt;

  UserModel(
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
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': firstName,
      'email': email,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
