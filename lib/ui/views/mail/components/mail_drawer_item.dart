/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_app_button.dart';

class MailDrawerItem extends StatelessWidget {
  const MailDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.isSelected = false,
    this.height = 45,
  });
  final String title;
  final String icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isSelected;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomAppButton(
        bgColor: styles.theme.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        onPressed: onTap,
        child: Row(
          children: [
            CustomSvg(icon).svg(color: isSelected ? styles.theme.blue : styles.theme.grey4, size: 24),
            const Gap(20),
            Text(title, style: styles.text.b1.textColor(isSelected ? styles.theme.blue : styles.theme.grey6)),
            const Spacer(),
            trailing ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
