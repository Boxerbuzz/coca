/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectBoardStatItem extends StatelessWidget {
  const ProjectBoardStatItem({super.key, required this.icon, required this.value});
  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvg(icon).svg(),
        Gap(styles.insets.xs),
        Text(value, style: styles.text.p),
      ],
    );
  }
}
