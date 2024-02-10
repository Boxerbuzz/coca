/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/cupertino.dart';

import '../../../../coca.dart';
import 'my_task_list.dart';
import 'task_calendar.dart';

class TaskBody extends BaseStatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, store, child) {
        return Column(
          children: [
            Gap(styles(context).insets.md),
            CustomTabBar(
              index: store.page,
              sections: const ['My Work', 'Calendar'],
              onChanged: (value) {
                store.page = value;
              },
            ),
            Gap(styles(context).insets.sm),
            Expanded(
              child: CustomIndexedStack(
                index: store.page,
                children: const [
                  MyTaskList(),
                  TaskCalendar(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
