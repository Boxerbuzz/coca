/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectViewSwitcherItem extends BaseStatelessWidget {
  const ProjectViewSwitcherItem(
      {super.key, required this.icon, required this.label, this.onPressed, this.isSelected = false});
  final String icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(styles(context).insets.xs),
      decoration: BoxDecoration(
        color: styles(context).theme.grey2,
        borderRadius: styles(context).corners.br8,
        border: Border.all(color: isSelected ? styles(context).theme.blue : styles(context).theme.silver),
      ),
      child: Row(
        children: [
          CustomSvg(icon).svg(color: isSelected ? styles(context).theme.blue : styles(context).theme.grey4),
          const SizedBox(width: 8),
          Text(
            label.capitalize(),
            style: styles(context)
                .text
                .b1
                .textColor(isSelected ? styles(context).theme.blue : styles(context).theme.grey4),
          ),
        ],
      ),
    ).clickable(onPressed);
  }
}
