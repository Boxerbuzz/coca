/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_app_button.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key, required this.text, this.onPressed, this.textColor, this.borderColor, this.shrinkWrap = false});
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;

  final Color? borderColor;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    Widget content = CustomAppButton(
      onPressed: onPressed,
      bgColor: Colors.transparent,
      border: BorderSide(color: borderColor ?? styles.theme.grey7),
      expand: shrinkWrap ? false : true,
      child: Text(text, style: styles.text.b1.textColor(textColor ?? styles.theme.grey7)),
    );

    if (shrinkWrap) return content;

    return SizedBox(height: 48, child: content);
  }
}
