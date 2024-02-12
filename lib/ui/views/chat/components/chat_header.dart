/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/app_bar/custom_back_button.dart';

class ChatHeader extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ChatHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles(context).theme.white, boxShadow: styles(context).shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomBackButton().padding(left: styles(context).insets.xxs),
            Text('New Chat', style: styles(context).text.t1),
            CustomIconButton(icon: Assets.images.icons.search, onPressed: () {})
                .padding(right: styles(context).insets.sm),
          ],
        ),
      );
}
