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
        Expanded(child: Divider(color: styles(context).theme.grey3)),
        Gap(styles(context).insets.md),
        Text('OR', style: styles(context).text.t1.textColor(styles(context).theme.grey4)),
        Gap(styles(context).insets.md),
        Expanded(child: Divider(color: styles(context).theme.grey3)),
      ],
    );
  }
}
