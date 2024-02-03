/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/task_body.dart';
import 'components/task_header.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  static const String route = '/tasks';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TaskHeader(),
      body: TaskBody(),
    );
  }
}
