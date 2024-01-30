/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HelpItem extends StatelessWidget {
  const HelpItem({super.key, this.title = '', this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: styles.insets.md, vertical: styles.insets.sm),
        child: Row(
          children: [
            Expanded(
              child: Text(title, style: styles.text.b1),
            ),
            Assets.images.icons.arrowRight.svg(color: styles.theme.grey4, height: 24, width: 24),
          ],
        ),
      ),
    );
  }
}
