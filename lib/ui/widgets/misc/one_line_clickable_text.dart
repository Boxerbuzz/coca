/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class OneLineClickableText extends StatelessWidget {
  const OneLineClickableText({super.key, required this.actionText, required this.mainText, this.onTap});

  final String mainText;
  final String actionText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: styles.insets.xs),
        minimumSize: Size.zero,
      ),
      child: Wrap(
        children: [
          Text(mainText, style: styles.text.b1.textColor(styles.theme.grey4).regular),
          Text(' $actionText', style: styles.text.b1.copyWith(color: styles.theme.blue)),
        ],
      ),
    );
  }
}
