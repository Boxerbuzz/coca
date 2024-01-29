/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomSubHeader extends StatelessWidget {
  const CustomSubHeader({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: styles.text.t1),
        const Spacer(),
        if (onPressed != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: styles.insets.xs), minimumSize: Size.zero),
            child: Text('View All', style: styles.text.b1.textColor(styles.theme.blue)),
          ),
      ],
    );
  }
}
