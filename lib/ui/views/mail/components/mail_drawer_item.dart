/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_app_button.dart';

class MailDrawerItem extends BaseStatelessWidget {
  MailDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.isSelected = false,
    this.height = 45,
    required this.getPosition,
  });
  final String title;
  final String icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isSelected;
  final double height;
  final ValueChanged<Offset> getPosition;

  /// global key for getting global positions on the widget, this safely helps us places the indicator on the right position
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      height: height,
      child: CustomAppButton(
        bgColor: styles(context).theme.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        onPressed: () {
          onTap?.call();
          getPosition(offset);
        },
        child: Row(
          children: [
            CustomSvg(icon).svg(color: isSelected ? styles(context).theme.blue : styles(context).theme.grey4, size: 24),
            const Gap(20),
            Text(title,
                style: styles(context)
                    .text
                    .b1
                    .textColor(isSelected ? styles(context).theme.blue : styles(context).theme.grey6)),
            const Spacer(),
            trailing ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  Offset get offset {
    final RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }
}
