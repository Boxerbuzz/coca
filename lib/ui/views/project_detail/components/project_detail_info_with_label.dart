/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailInfoWithLabel extends BaseStatelessWidget {
  const ProjectDetailInfoWithLabel({super.key, required this.title, this.value, this.childValue});
  final String title;
  final Widget? childValue;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: styles(context).text.caption.regular),
        const Gap(11),
        childValue ?? Text(value ?? 'No value', style: styles(context).text.t2.bold),
      ],
    );
  }
}
