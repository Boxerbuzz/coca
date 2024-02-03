/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../coca.dart';
import 'components/notification_body.dart';
import 'components/notification_category_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static String route = '/notification';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  /// whether of not the category list is shown atop the notification screen.
  bool _categories = true;

  /// scroll listener to show/hide the category list when scrolling.
  void _listener() async {
    NotificationProvider store = Provider.of<NotificationProvider>(context, listen: false);

    if (store.controller.position.userScrollDirection == ScrollDirection.reverse) {
      _categories = false;
    }
    if (store.controller.position.userScrollDirection == ScrollDirection.forward) {
      _categories = true;
    }
  }

  @override
  void initState() {
    super.initState();

    NotificationProvider store = Provider.of<NotificationProvider>(context, listen: false);

    /// obviously we do not want to call the line below if the list of notification is empty.
    /// ideally may not be necessary in a real world scenario.
    if (!store.empty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _listener());
    }
  }

  @override
  Widget build(BuildContext context) {
    bool empty = Provider.of<NotificationProvider>(context, listen: false).empty;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: Column(
        children: [
          if (_categories) ...[
            Gap(styles.insets.sm),
            const NotificationCategoryList(),
          ],
          if (empty) ...{
            Divider(color: styles.theme.silver),
          },
          const NotificationBody(),
        ],
      ),
    );
  }
}
