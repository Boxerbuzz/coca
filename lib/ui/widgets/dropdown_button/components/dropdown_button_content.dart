/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class DropdownButtonContent extends StatelessWidget {
  const DropdownButtonContent(
      {super.key, required this.value, this.icon, this.isOpen = false, this.height = 36, this.width = 100});
  final String value;
  final String? icon;
  final bool isOpen;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: styles.theme.silver),
        color: styles.theme.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(styles.corners.sm),
          topRight: Radius.circular(styles.corners.sm),
          bottomLeft: Radius.circular(isOpen ? 0 : styles.corners.sm),
          bottomRight: Radius.circular(isOpen ? 0 : styles.corners.sm),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            CustomSvg(icon!).svg(color: styles.theme.grey7),
            Gap(styles.insets.xs),
          ],
          Text(value.capitalize(), style: styles.text.b1),
          const Spacer(),
          CustomSvg(Assets.images.icons.arrowDropdown).svg(color: styles.theme.grey6),
        ],
      ),
    );
  }
}
