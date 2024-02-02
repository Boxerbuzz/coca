/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class NotificationEmptyPlaceholder extends StatelessWidget {
  const NotificationEmptyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyPlaceHolder(
        title: 'Ops! There are no notifications',
        subtitle: "You'll be notified of new activities, collaborations invites and tasks assigned to you.",
        assets: Assets.images.icons.emptyNotification.path);
  }
}
