/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/cupertino.dart';

import '../../../../coca.dart';
import 'notification_category_list.dart';
import 'notification_empty_placeholder.dart';
import 'notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (_, store, __) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              delegate: CustomSliverAppBarDelegate(
                  minHeight: 50.0,
                  maxHeight: 50.0,
                  child: Container(color: styles.theme.grey3, child: const NotificationCategoryList())),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (_, int index) {
                  return store.empty
                      ? NotificationEmptyPlaceholder(height: context.heightPct(.7))
                      : Column(children: [...notifications.map((e) => NotificationItem(data: e))]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
