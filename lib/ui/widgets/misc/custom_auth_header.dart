/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomAuthHeader extends BaseStatelessWidget {
  const CustomAuthHeader({super.key, required this.headerText, required this.subHeaderText});

  final String headerText;
  final String subHeaderText;

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: styles.text.h3),
        Gap(styles.insets.xs),
        Text(subHeaderText, style: styles.text.caption.textColor(kGray04)),
        Gap(styles.insets.md),
      ],
    );
  }
}
