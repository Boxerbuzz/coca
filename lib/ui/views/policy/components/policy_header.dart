/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/app_bar/custom_back_button.dart';

class PolicyHeader extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const PolicyHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: EdgeInsets.only(right: styles.insets.md),
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles.theme.white, boxShadow: styles.shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBackButton(),
            const Spacer(),
            Text('Privacy Policy', style: styles.text.t1.textColor(styles.theme.grey7)),
            const Spacer(),
            CustomSvg(Assets.images.icons.share).svg(height: 24, width: 24),
          ],
        ),
      );
}
