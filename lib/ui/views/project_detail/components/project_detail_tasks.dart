/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../coca.dart';
import 'project_detail_task_sub_task.dart';

class ProjectDetailTasks extends BaseStatelessWidget {
  const ProjectDetailTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
      child: Column(
        children: [
          Gap(styles(context).insets.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSvg(Assets.images.icons.checkSquare).svg(color: styles(context).theme.grey7),
              Gap(styles(context).insets.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Task List', style: styles(context).text.t1),
                        Expanded(child: Container()),
                        CustomSvg(Assets.images.icons.plus)
                            .svg(color: styles(context).theme.grey7)
                            .clickable(() => context.push(CreateTaskScreen.route)),
                      ],
                    ),
                    Gap(styles(context).insets.xs),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('73%', style: styles(context).text.t1),
                            Text('Progress', style: styles(context).text.t3),
                          ],
                        ),
                        Gap(styles(context).insets.sm),
                        CircularPercentIndicator(
                          radius: 18,
                          lineWidth: 4.0,
                          animation: true,
                          percent: 0.7,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: styles(context).theme.green,
                          backgroundColor: styles(context).theme.grey3,
                          animateFromLastPercent: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(styles(context).insets.sm),
          Divider(color: styles(context).theme.silver),
          Gap(styles(context).insets.xs),
          ProjectDetailTaskSubTask(task: 'Define Problem with Client', onChanged: (bool value) {}, value: true),
          ProjectDetailTaskSubTask(task: 'Create Wireframe and User Flow', onChanged: (bool value) {}, value: true),
          ProjectDetailTaskSubTask(task: 'Visual High Fidelity', onChanged: (bool value) {}),
          ProjectDetailTaskSubTask(task: 'Feedback from Client', onChanged: (bool value) {}),
          Gap(styles(context).insets.md),
        ],
      ),
    );
  }
}
