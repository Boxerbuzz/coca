/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/cupertino.dart';

import '../../../../coca.dart';
import 'notification_empty_placeholder.dart';
import 'notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, store, child) {
        return Expanded(
          child: store.empty
              ? const NotificationEmptyPlaceholder()
              : SingleChildScrollView(
                  controller: store.controller,
                  child: Column(
                    children: [
                      ...notifications.map((e) => NotificationItem(data: e)),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
