/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, this.onPressed, required this.title, required this.icon, this.icColor, this.txtColor});
  final VoidCallback? onPressed;
  final String title;
  final String icon;
  final Color? icColor;
  final Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(border: Border(top: BorderSide(color: styles.theme.grey3))),
        padding: EdgeInsets.all(styles.insets.xs),
        margin: EdgeInsets.symmetric(horizontal: styles.insets.md),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(borderRadius: styles.corners.br24, color: styles.theme.grey2),
              child: CustomSvg(icon).svg(width: 24, height: 24, color: icColor),
            ),
            const Gap(16),
            Expanded(child: Text(title, style: styles.text.b1.textColor(txtColor ?? styles.theme.grey7))),
            CustomSvg(Assets.images.icons.arrowRight).svg(width: 24, height: 24)
          ],
        ),
      ),
    );
  }
}
