/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomBadge extends BaseStatelessWidget {
  const CustomBadge(this.value, {super.key, this.width});
  final String value;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: styles(context).insets.xxs, horizontal: styles(context).insets.xs),
      decoration: BoxDecoration(color: styles(context).theme.red, borderRadius: styles(context).corners.br12),
      child: Text(
        value,
        style: styles(context).text.caption.textColor(Colors.white),
      ),
    );
  }
}
