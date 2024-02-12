/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/my_task_model.dart';
import 'task_list_item.dart';
import 'task_list_item_header.dart';

class TaskListCollapsibleItem extends StatefulWidget {
  const TaskListCollapsibleItem({super.key, required this.data, this.isExpanded = true});
  final MyTaskModel data;
  final bool isExpanded;

  @override
  State<TaskListCollapsibleItem> createState() => _TaskListCollapsibleItemState();
}

class _TaskListCollapsibleItemState extends BaseStatefulWidget<TaskListCollapsibleItem> {
  bool _isExpanded = false;
  MyTaskModel get data => widget.data;

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md).add(EdgeInsets.only(top: styles.insets.sm)),
      child: Column(
        children: [
          TaskListItemHeader(
              data: data,
              toggleReveal: () => setState(() => _isExpanded = !_isExpanded),
              showContextMenu: () {},
              isOpened: _isExpanded),
          AnimatedCrossFade(
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: EdgeInsets.symmetric(vertical: styles.insets.sm, horizontal: styles.insets.xxs),
              child: Column(
                children: [
                  ...data.tasks.map((e) => TaskListItem(data: e)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
