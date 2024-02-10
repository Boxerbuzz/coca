/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomPaddedSafeArea extends BaseStatelessWidget {
  const CustomPaddedSafeArea({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(padding: EdgeInsets.all(styles(context).insets.sm), child: child),
    );
  }
}
