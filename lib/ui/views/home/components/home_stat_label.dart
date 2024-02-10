/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeStatLabel extends BaseStatelessWidget {
  const HomeStatLabel({super.key, required this.label, required this.stats});
  final String stats;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(stats, style: styles(context).text.h2),
        const Gap(2),
        Text(label, style: styles(context).text.t2.regular),
      ],
    );
  }
}
