/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      decoration: BoxDecoration(color: styles.theme.white, boxShadow: styles.shadows.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Profile', style: styles.text.h2.textColor(styles.theme.grey7)),
          Expanded(child: Container()),
          CustomSvg(Assets.images.icons.search).svg(height: 24, width: 24),
        ],
      ),
    );
  }
}
