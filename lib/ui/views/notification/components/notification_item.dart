/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.data});
  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: data.id,
                child: CustomAvatar(
                  path: Assets.images.avatar.user.path,
                  isLocal: true,
                ),
              ),
              Gap(styles.insets.btn),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomRichTextRender(data.subject),
                    const SizedBox(height: 2),
                    Text(data.time, style: styles.text.b2.textColor(styles.theme.grey4)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(color: styles.theme.silver),
      ],
    );
  }
}
