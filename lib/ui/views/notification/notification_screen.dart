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

  void _scrollListener() async {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _scrollListener());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: Column(
        children: [
          if (_categories) ...[
            Gap(styles.insets.sm),
            const NotificationCategoryList(),
          ],
          Divider(color: styles.theme.silver),
          const NotificationBody(),
        ],
      ),
    );
  }
}
