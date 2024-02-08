/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/app_bar/custom_back_button.dart';

class ProjectDetailHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ProjectDetailHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: EdgeInsets.only(right: styles.insets.md, left: styles.insets.xs),
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles.theme.white, boxShadow: styles.shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBackButton.close(),
            const Spacer(),
            CustomSvg(Assets.images.icons.dots).svg(height: 24, width: 24),
          ],
        ),
      );
}
