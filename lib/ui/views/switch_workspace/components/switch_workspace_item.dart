/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SwitchWorkspaceItem extends BaseStatelessWidget {
  const SwitchWorkspaceItem({super.key, this.isSelected = false, this.onPressed, this.workspace});
  final bool isSelected;
  final VoidCallback? onPressed;
  final WorkspaceModel? workspace;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: styles(context).insets.sm, horizontal: styles(context).insets.md),
        decoration: BoxDecoration(
          borderRadius: styles(context).corners.br12,
          color: isSelected ? styles(context).theme.blue.withOpacity(.1) : styles(context).theme.white,
          boxShadow: styles(context).shadows.sm,
          border: Border.all(color: isSelected ? styles(context).theme.blue : styles(context).theme.silver),
        ),
        child: Row(
          children: [
            Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    borderRadius: styles(context).corners.br8,
                    color: styles(context).theme.white,
                    boxShadow: styles(context).shadows.sm,
                    border: Border.all(color: styles(context).theme.silver)),
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(workspace?.image ?? '')),
            Gap(styles(context).insets.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workspace?.name ?? "San Designs", style: styles(context).text.t1),
                Text("${workspace?.participants.length ?? 12} Members",
                    style: styles(context).text.t3.textColor(styles(context).theme.grey4)),
              ],
            ),
            Expanded(child: Container()),
            if (isSelected)
              CustomSvg(Assets.images.icons.check).svg(height: 24, width: 24, color: styles(context).theme.blue),
          ],
        ),
      ),
    );
  }
}
