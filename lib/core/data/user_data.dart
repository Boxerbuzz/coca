/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../../ui/coca.dart';

List<UserModel> _userData() {
  final List<Map<String, dynamic>> rawUserData = [];

  Faker faker = Faker();

  UserModel user = UserModel(
    id: faker.guid.guid(),
    firstName: faker.person.firstName(),
    lastName: faker.person.lastName(),
    email: faker.internet.email(),
    image: faker.image.image(),
    createdAt: faker.date.dateTime().toString(),
    updatedAt: faker.date.dateTime().toString(),
  );

  for (int i = 0; i < 20; i++) {
    rawUserData.add(user.toJson());
  }

  return rawUserData.map((e) => UserModel.fromJson(e)).toList();
}

final List<UserModel> userData = _userData();
