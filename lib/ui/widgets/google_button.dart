/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GoogleButton extends BaseStatelessWidget {
  const GoogleButton({super.key, required this.label, this.onPressed});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.height * (0.01)),
      height: 48,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(borderRadius: context.styles.corners.br8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: context.styles.corners.br4,
            side: const BorderSide(color: kGray03),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 15), child: Assets.images.icons.googleLogo.svg()),
            const Gap(10),
            Text(label, style: context.styles.text.b1.textColor(kGray06)),
          ],
        ),
      ),
    );
  }
}
