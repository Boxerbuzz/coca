/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomAuthHeader extends BaseStatelessWidget {
  const CustomAuthHeader({super.key, required this.headerText, required this.subHeaderText});

  final String headerText;
  final String subHeaderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: styles(context).text.h3.textColor(styles(context).theme.grey8)),
        Gap(styles(context).insets.xs),
        Text(subHeaderText, style: styles(context).text.caption.textColor(styles(context).theme.grey5)),
        Gap(styles(context).insets.md),
      ],
    );
  }
}
