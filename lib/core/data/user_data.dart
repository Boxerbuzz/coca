/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:math';

import 'package:faker/faker.dart';

import '../models/user_model.dart';

List<UserModel> _userData() {
  final List<Map<String, dynamic>> rawUserData = [];

  Faker faker = Faker();

  for (int i = 0; i < 20; i++) {
    UserModel user = UserModel(
      id: faker.guid.guid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      email: faker.internet.email(),
      image: faker.image.image(random: true, keywords: ['faces'], height: 50, width: 50),
      createdAt: faker.date.dateTime().toString(),
      updatedAt: faker.date.dateTime().toString(),
    );
    rawUserData.add(user.toJson());
  }

  return rawUserData.map((e) => UserModel.fromJson(e)).toList();
}

final List<UserModel> users = _userData();

List<UserModel> participants() {
  Random random = Random();

  List<UserModel> temp = users;

  temp.shuffle(random);

  return temp.take(5).toList();
}
