/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class PremiumHeader extends StatelessWidget {
  const PremiumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(styles.insets.xs),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(icon: Assets.images.icons.x, onPressed: () => context.pop(), color: styles.theme.grey7),
            Expanded(child: Container()),
            CustomIconButton(
              icon: Assets.images.icons.share,
              onPressed: () => context.pop(),
              color: styles.theme.grey7,
            ),
          ],
        ),
      ),
    );
  }
}
