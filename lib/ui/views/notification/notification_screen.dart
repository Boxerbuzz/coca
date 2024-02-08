/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/notification_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static String route = '/notification';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Notifications'),
      body: NotificationBody(),
    );
  }
}
