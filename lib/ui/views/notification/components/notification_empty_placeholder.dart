/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class NotificationEmptyPlaceholder extends StatelessWidget {
  const NotificationEmptyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgGenImage(Assets.images.icons.emptyNotification.path).svg(width: 119, height: 112),
          Gap(styles.insets.md),
          Text('Ops! There are no notifications', style: styles.text.t1, textAlign: TextAlign.center),
          Gap(styles.insets.xs),
          Text(
            "You'll be notified of new activities, collaborations invites and tasks assigned to you.",
            style: styles.text.t2.textColor(styles.theme.grey4).regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
