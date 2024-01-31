/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_app_button.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.text = '',
    this.icon = '',
    this.btnColor,
    this.iconColor,
    this.border,
    this.txtColor,
    this.onPressed,
  });
  final String text;
  final String icon;
  final Color? btnColor;
  final Color? iconColor;
  final BorderSide? border;
  final Color? txtColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: CustomAppButton(
        bgColor: btnColor ?? styles.theme.blue,
        border: border,
        expand: true,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgGenImage(icon).svg(height: 20, width: 20, color: iconColor ?? styles.theme.white),
            const Gap(12),
            Text(text, style: styles.text.b1.textColor(txtColor ?? styles.theme.white)),
          ],
        ),
      ),
    );
  }
}
