/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:ui';

import 'package:equatable/equatable.dart';

class MailGalleryModel extends Equatable {
  final String path;
  final Color? color;
  final bool isMini;
  final int index, cross;
  final double main;

  const MailGalleryModel(
      {this.path = '', this.color, this.isMini = false, this.index = 0, this.cross = 0, this.main = 0});

  @override
  List<Object?> get props => [path, color, isMini, index, cross, main];
}
