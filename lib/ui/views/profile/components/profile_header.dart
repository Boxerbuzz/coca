/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProfileHeader extends BaseStatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
      decoration: BoxDecoration(color: styles(context).theme.white, boxShadow: styles(context).shadows.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Profile', style: styles(context).text.h2.textColor(styles(context).theme.grey7)),
          Expanded(child: Container()),
          CustomSvg(Assets.images.icons.search).svg(height: 24, width: 24),
        ],
      ),
    );
  }
}
