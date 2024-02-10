/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_app_button.dart';

class CustomButtonWithIcon extends BaseStatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.text = '',
    this.icon = '',
    this.btnColor,
    this.iconColor,
    this.border,
    this.txtColor,
    this.onPressed,
    this.shrinkWrap = false,
  });
  final String text;
  final String icon;
  final Color? btnColor;
  final Color? iconColor;
  final BorderSide? border;
  final Color? txtColor;
  final VoidCallback? onPressed;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    Widget content = CustomAppButton(
      bgColor: btnColor ?? styles(context).theme.blue,
      border: border,
      expand: shrinkWrap ? false : true,
      onPressed: onPressed,
      padding: shrinkWrap ? const EdgeInsets.symmetric(horizontal: 15, vertical: 8) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvg(icon).svg(height: 20, width: 20, color: iconColor ?? styles(context).theme.white),
          const Gap(12),
          Text(text, style: styles(context).text.b1.textColor(txtColor ?? styles(context).theme.white)),
        ],
      ),
    );

    if (shrinkWrap) return content;

    return SizedBox(height: 48, child: content);
  }
}
