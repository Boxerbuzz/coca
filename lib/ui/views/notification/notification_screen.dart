/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/notification_body.dart';
import 'components/notification_header.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static String route = '/notification';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NotificationHeader(),
      body: NotificationBody(),
    );
  }
}
