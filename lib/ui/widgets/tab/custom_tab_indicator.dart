/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomTabIndicator extends StatelessWidget {
  const CustomTabIndicator({super.key, this.width, this.color});
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(color: color, borderRadius: styles.corners.br24),
    );
  }
}
