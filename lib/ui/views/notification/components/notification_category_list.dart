/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'notification_category_item.dart';

class NotificationCategoryList extends BaseStatelessWidget {
  const NotificationCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 50,
      child: CustomHorizontalScroll(
        child: Row(
          children: [
            Gap(styles(context).insets.sm),
            const NotificationCategoryItem(index: 0, title: "All"),
            const NotificationCategoryItem(index: 1, title: "Following"),
            const NotificationCategoryItem(index: 2, title: "Assigned to me"),
            const NotificationCategoryItem(index: 3, title: "@Mentions"),
            const NotificationCategoryItem(index: 4, title: "Assigned by you"),
          ],
        ),
      ),
    );
  }
}
