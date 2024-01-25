/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomMaterialButton extends BaseStatelessWidget {
  final Color? backgroundColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final Widget child;

  const CustomMaterialButton({
    this.backgroundColor = kBlue,
    this.borderRadius = 8.0,
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkResponse(
        onTap: onTap,
        containedInkWell: true,
        highlightShape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}
