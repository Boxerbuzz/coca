/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomSubHeader extends BaseStatelessWidget {
  const CustomSubHeader({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: styles(context).text.t1),
        const Spacer(),
        if (onPressed != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: styles(context).insets.xs), minimumSize: Size.zero),
            child: Text('View All', style: styles(context).text.b1.textColor(styles(context).theme.blue)),
          ),
      ],
    );
  }
}
