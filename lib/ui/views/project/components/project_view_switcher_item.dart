/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectViewSwitcherItem extends StatelessWidget {
  const ProjectViewSwitcherItem(
      {super.key, required this.icon, required this.label, this.onPressed, this.isSelected = false});
  final String icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(styles.insets.xs),
      decoration: BoxDecoration(
        color: styles.theme.grey2,
        borderRadius: styles.corners.br8,
        border: Border.all(color: isSelected ? styles.theme.blue : styles.theme.silver),
      ),
      child: Row(
        children: [
          SvgGenImage(icon).svg(color: isSelected ? styles.theme.blue : styles.theme.grey4),
          const SizedBox(width: 8),
          Text(
            label.capitalize(),
            style: styles.text.b1.textColor(isSelected ? styles.theme.blue : styles.theme.grey4),
          ),
        ],
      ),
    ).clickable(onPressed);
  }
}
