/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SwitchWorkspaceItem extends StatelessWidget {
  const SwitchWorkspaceItem({super.key, this.isSelected = false, this.onPressed, this.workspace});
  final bool isSelected;
  final VoidCallback? onPressed;
  final WorkspaceModel? workspace;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: styles.insets.sm, horizontal: styles.insets.md),
        decoration: BoxDecoration(
          borderRadius: styles.corners.br12,
          color: isSelected ? styles.theme.blue.withOpacity(.1) : styles.theme.white,
          boxShadow: styles.shadows.sm,
          border: Border.all(color: isSelected ? styles.theme.blue : styles.theme.silver),
        ),
        child: Row(
          children: [
            Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    borderRadius: styles.corners.br8,
                    color: styles.theme.white,
                    boxShadow: styles.shadows.sm,
                    border: Border.all(color: styles.theme.silver)),
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(workspace?.image ?? '')),
            Gap(styles.insets.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workspace?.name ?? "San Designs", style: styles.text.t1),
                Text("${workspace?.participants.length ?? 12} Members",
                    style: styles.text.t3.textColor(styles.theme.grey4)),
              ],
            ),
            Expanded(child: Container()),
            if (isSelected) Assets.images.icons.check.svg(height: 24, width: 24, color: styles.theme.blue),
          ],
        ),
      ),
    );
  }
}
