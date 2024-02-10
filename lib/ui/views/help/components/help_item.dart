/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HelpItem extends BaseStatelessWidget {
  const HelpItem({super.key, this.title = '', this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md, vertical: styles(context).insets.sm),
        child: Row(
          children: [
            Expanded(child: Text(title, style: styles(context).text.b1)),
            CustomSvg(Assets.images.icons.arrowRight).svg(color: styles(context).theme.grey4, height: 24, width: 24),
          ],
        ),
      ),
    );
  }
}
