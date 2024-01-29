/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StatModel extends Equatable {
  final String icon, label, stat;
  final Color? color;
  final bool isMini;
  final int index, cross;
  final double main;

  const StatModel(
      {this.icon = '',
      this.stat = '',
      this.label = '',
      this.color,
      this.isMini = false,
      this.index = 0,
      this.cross = 0,
      this.main = 0});

  @override
  List<Object?> get props => [icon, stat, label, color, isMini, index, cross, main];
}
