/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeStatIcon extends StatelessWidget {
  const HomeStatIcon({super.key, this.color, required this.icon});
  final Color? color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)),
      child: CustomSvg(icon).svg(),
    );
  }
}
