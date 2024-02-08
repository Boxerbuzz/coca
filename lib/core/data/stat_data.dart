/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:ui';

import '../../gen/assets.gen.dart';
import '../models/stat_model.dart';

final List<StatModel> stats = [
  StatModel(
      label: 'Project Completed',
      stat: '140',
      icon: Assets.images.icons.checkCircle,
      color: const Color(0xffFFD88D),
      isMini: false,
      index: 0,
      main: 2.6,
      cross: 2),
  StatModel(
      label: 'Inquiry',
      stat: '12',
      icon: Assets.images.icons.coffee,
      color: const Color(0xffB1E5FC),
      isMini: true,
      index: 1,
      main: 1.3,
      cross: 2),
  StatModel(
      label: 'On Going',
      stat: '28',
      icon: Assets.images.icons.compass,
      color: const Color(0xffCABDFF),
      isMini: true,
      index: 2,
      main: 1.3,
      cross: 2)
];
