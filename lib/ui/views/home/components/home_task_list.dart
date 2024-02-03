/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'home_task_item.dart';

class HomeTaskList extends StatelessWidget {
  const HomeTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: Column(
        children: [
          CustomSubHeader(title: "Today's Task", onPressed: () => context.push(TaskScreen.route)),
          const Gap(12),
          ...tasks.map((e) => HomeTaskItem(data: e))
        ],
      ),
    );
  }
}
