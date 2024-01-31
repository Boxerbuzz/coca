/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

class ProjectLayoutModel extends Equatable {
  const ProjectLayoutModel({required this.id, required this.name, required this.icon});

  final int id;
  final String name;
  final String icon;

  @override
  List<Object?> get props => [id, name, icon];
}
