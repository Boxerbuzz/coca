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
  Widget build(BuildContext context) => Consumer<MailProvider>(
        builder: (context, store, child) {
          return Container(
            height: preferredSize.height,
            padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
            margin: EdgeInsets.only(top: context.mq.padding.top),
            decoration: BoxDecoration(color: styles(context).theme.white, boxShadow: styles(context).shadows.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Inbox', style: styles(context).text.h2.textColor(styles(context).theme.grey7)),
                Expanded(child: Container()),
                CustomSvg(Assets.images.icons.search).svg(height: 24, width: 24),
                const Gap(24),
                CustomIconButton(
                  icon: Assets.images.icons.burger,
                  bgColor: styles(context).theme.grey2,
                  onPressed: () => store.toggleDrawer(),
                  color: styles(context).theme.grey8,
                ),
              ],
            ),
          );
        },
      );
}
