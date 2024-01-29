/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'custom_app_button.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.border,
      this.bgColor,
      this.size,
      this.semanticLabel});

  static double defaultSize = 40;

  final VoidCallback onPressed;
  final Color? bgColor;
  final BorderSide? border;
  final Widget child;
  final double? size;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    double sz = size ?? defaultSize;
    return CustomAppButton(
      onPressed: onPressed,
      semanticLabel: semanticLabel,
      minimumSize: Size(sz, sz),
      padding: EdgeInsets.zero,
      circular: true,
      bgColor: bgColor,
      border: border,
      child: child,
    );
  }
}
