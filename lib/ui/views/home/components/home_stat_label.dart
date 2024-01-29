/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeStatLabel extends StatelessWidget {
  const HomeStatLabel({super.key, required this.label, required this.stats});
  final String stats;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(stats, style: styles.text.h2),
        const Gap(2),
        Text(label, style: styles.text.t2.regular),
      ],
    );
  }
}
