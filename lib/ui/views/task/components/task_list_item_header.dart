/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/my_task_model.dart';

class TaskListItemHeader extends StatelessWidget {
  const TaskListItemHeader({
    super.key,
    required this.data,
    required this.toggleReveal,
    required this.showContextMenu,
    this.isOpened = false,
  });
  final MyTaskModel data;
  final VoidCallback toggleReveal;
  final VoidCallback showContextMenu;
  final bool isOpened;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: styles.insets.xxs),
        child: Row(
          children: [
            RotatedBox(
              quarterTurns: isOpened ? 2 : 3,
              child: CustomIconButton(
                  onPressed: toggleReveal,
                  icon: Assets.images.icons.arrowDown,
                  size: 16,
                  iconSize: 20,
                  color: styles.theme.grey4),
            ),
            const Gap(12),
            Text(data.title, style: styles.text.t1),
            Gap(styles.insets.xs),
            Container(
              height: 22,
              width: 28,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: styles.theme.grey2),
              child: Center(child: Text(data.taskCount.toString(), style: styles.text.b1)),
            ),
            Expanded(child: Container()),
            CustomIconButton(
              icon: Assets.images.icons.dots,
              onPressed: showContextMenu,
              size: 24,
              iconSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
