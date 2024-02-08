/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ToolbarModel extends Equatable {
  final String title;
  final String icon;
  final String id;
  final int? level;
  final Color? color;

  const ToolbarModel({this.title = '', this.icon = '', this.id = '', this.level, this.color});

  @override
  List<Object?> get props => [title, icon, id, level, color];
}
