/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomSubHeader extends StatelessWidget {
  const CustomSubHeader({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: context.styles.text.t1),
        const Spacer(),
        if (onPressed != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: context.styles.insets.xs),
              minimumSize: Size.zero,
            ),
            child: Text('View All', style: context.styles.text.b1.textColor(kBlue)),
          ),
      ],
    );
  }
}
