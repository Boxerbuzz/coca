/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class MailHeader extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const MailHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles.theme.white, boxShadow: styles.shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Inbox', style: styles.text.h2.textColor(styles.theme.grey7)),
            Expanded(child: Container()),
            CustomSvg(Assets.images.icons.search).svg(height: 24, width: 24),
            const Gap(24),
            CustomIconButton(
              icon: Assets.images.icons.burger,
              bgColor: styles.theme.grey2,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              color: styles.theme.grey8,
            ),
          ],
        ),
      );
}
