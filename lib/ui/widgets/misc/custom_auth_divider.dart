/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomAuthDivider extends BaseStatelessWidget {
  const CustomAuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: styles.theme.grey3)),
        Gap(styles.insets.md),
        Text('OR', style: styles.text.t1.textColor(styles.theme.grey4)),
        Gap(styles.insets.md),
        Expanded(child: Divider(color: styles.theme.grey3)),
      ],
    );
  }
}
