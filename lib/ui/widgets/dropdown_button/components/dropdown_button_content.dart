/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class DropdownButtonContent extends BaseStatelessWidget {
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
        border: Border.all(color: styles(context).theme.silver),
        color: styles(context).theme.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(styles(context).corners.sm),
          topRight: Radius.circular(styles(context).corners.sm),
          bottomLeft: Radius.circular(isOpen ? 0 : styles(context).corners.sm),
          bottomRight: Radius.circular(isOpen ? 0 : styles(context).corners.sm),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            CustomSvg(icon!).svg(color: styles(context).theme.grey7),
            Gap(styles(context).insets.xs),
          ],
          Text(value.capitalize(), style: styles(context).text.b1),
          const Spacer(),
          CustomSvg(Assets.images.icons.arrowDropdown).svg(color: styles(context).theme.grey6),
        ],
      ),
    );
  }
}
