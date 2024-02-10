/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomGoogleButton extends BaseStatelessWidget {
  const CustomGoogleButton({super.key, required this.label, this.onPressed});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.height * (0.01)),
      height: 48,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(borderRadius: styles(context).corners.br8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: styles(context).corners.br4,
            side: BorderSide(color: styles(context).theme.grey3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: CustomSvg(Assets.images.icons.googleLogo).svg()),
            const Gap(10),
            Text(label, style: styles(context).text.b1.textColor(styles(context).theme.grey6)),
          ],
        ),
      ),
    );
  }
}
