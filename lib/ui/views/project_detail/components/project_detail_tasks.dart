/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../coca.dart';
import 'project_detail_task_sub_task.dart';

class ProjectDetailTasks extends StatelessWidget {
  const ProjectDetailTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: Column(
        children: [
          Gap(styles.insets.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.icons.checkSquare.svg(width: 24, height: 24),
              Gap(styles.insets.sm),
              Text('Task List', style: styles.text.t1),
              Expanded(child: Container()),
              CustomIconButton(
                  icon: Assets.images.icons.plus.path,
                  onPressed: () => context.push(CreateTaskScreen.route),
                  color: styles.theme.grey4),
            ],
          ),
          const Gap(13),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: styles.insets.xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('73%', style: styles.text.t1),
                    Text('Progress', style: styles.text.t3),
                  ],
                ),
                Gap(styles.insets.sm),
                CircularPercentIndicator(
                  radius: 18,
                  lineWidth: 4.0,
                  animation: true,
                  percent: 0.7,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: styles.theme.green,
                  backgroundColor: styles.theme.grey3,
                  animateFromLastPercent: true,
                ),
              ],
            ),
          ),
          Gap(styles.insets.sm),
          Divider(color: styles.theme.silver),
          Gap(styles.insets.xs),
          ProjectDetailTaskSubTask(task: 'Define Problem with Client', onChanged: (bool value) {}, value: true),
          ProjectDetailTaskSubTask(task: 'Create Wireframe and User Flow', onChanged: (bool value) {}, value: true),
          ProjectDetailTaskSubTask(task: 'Visual High Fidelity', onChanged: (bool value) {}),
          ProjectDetailTaskSubTask(task: 'Feedback from Client', onChanged: (bool value) {}),
          Gap(styles.insets.md),
        ],
      ),
    );
  }
}