/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.actionText, required this.mainText, this.onTap});

  final String mainText;
  final String actionText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: context.styles.insets.xs),
        minimumSize: Size.zero,
      ),
      child: Wrap(
        children: [
          Text(mainText, style: context.styles.text.p.textColor(kGray04)),
          Text(' $actionText', style: context.styles.text.b1.copyWith(color: kBlue)),
        ],
      ),
    );
  }
}
