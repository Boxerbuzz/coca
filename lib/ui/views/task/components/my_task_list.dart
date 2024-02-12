/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/my_task_data.dart';
import 'task_list_collapsible_item.dart';

class MyTaskList extends BaseStatelessWidget {
  const MyTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewWithFade(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ...data.map((e) => TaskListCollapsibleItem(data: e, isExpanded: true)),
        ],
      ),
    );
  }
}
