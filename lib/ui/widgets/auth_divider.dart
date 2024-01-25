/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthDivider extends BaseStatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Row(
      children: [
        const Expanded(child: Divider(color: kGray03)),
        Gap(styles.insets.md),
        Text('OR', style: styles.text.t1.textColor(kGray04)),
        Gap(styles.insets.md),
        const Expanded(child: Divider(color: kGray03)),
      ],
    );
  }
}
