/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectListItemTitle extends StatelessWidget {
  final TaskModel task;

  const ProjectListItemTitle(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    double size = 12;
    return Row(
      children: <Widget>[
        Container(
                width: size,
                height: size,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: styles.theme.silver, borderRadius: BorderRadius.circular(2)))
            .gestures(onTapUp: (d) => {}, behavior: HitTestBehavior.opaque),
        Gap(styles.insets.xs),
        Text(task.title,
                style: styles.text.b1.textColor(styles.theme.grey7),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis)
            .expanded(),
      ],
    );
  }
}
