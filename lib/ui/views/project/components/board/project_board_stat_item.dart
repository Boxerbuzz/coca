/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectBoardStatItem extends BaseStatelessWidget {
  const ProjectBoardStatItem({super.key, required this.icon, required this.value});
  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvg(icon).svg(),
        Gap(styles(context).insets.xxs),
        Text(value, style: styles(context).text.p),
      ],
    );
  }
}
