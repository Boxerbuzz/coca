/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class CustomInputActionItem extends BaseStatelessWidget {
  const CustomInputActionItem({super.key, this.color, required this.title, required this.icon, this.onPressed});
  final Color? color;
  final String title;
  final String icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(color: color, borderRadius: styles(context).corners.br32),
            padding: EdgeInsets.all(styles(context).insets.xs),
            child: CustomSvg(icon).svg(size: 28, color: styles(context).theme.grey7),
          ),
          const Gap(4),
          Text(title, style: styles(context).text.caption)
        ],
      ),
    );
  }
}
