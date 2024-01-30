/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_app_button.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({super.key, required this.text, this.onPressed, this.textColor, this.borderColor});
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;

  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: CustomAppButton(
        onPressed: onPressed,
        bgColor: Colors.transparent,
        border: BorderSide(color: borderColor ?? styles.theme.grey7),
        expand: true,
        child: Text(
          text,
          style: styles.text.b1.textColor(textColor ?? styles.theme.grey7),
        ),
      ),
    );
  }
}
