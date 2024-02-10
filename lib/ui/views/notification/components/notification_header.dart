/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/app_bar/custom_back_button.dart';

class NotificationHeader extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const NotificationHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles(context).theme.white, boxShadow: styles(context).shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBackButton().padding(left: 5),
            Expanded(child: Container()),
            Text('Notifications', style: styles(context).text.t1.textColor(styles(context).theme.grey7)),
            Expanded(child: Container()),
            CustomSvg(Assets.images.icons.search).svg(height: 24, width: 24).padding(right: 20),
          ],
        ),
      );
}
