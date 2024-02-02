/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.data});
  final TaskModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: styles.theme.silver), borderRadius: styles.corners.br12),
      padding: EdgeInsets.all(styles.insets.sm),
      margin: EdgeInsets.only(bottom: styles.insets.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(borderRadius: styles.corners.br4, color: styles.theme.silver),
              margin: const EdgeInsets.only(top: 2)),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LinkifyText(
                  data.title,
                  linkTypes: const [LinkType.userTag],
                  linkStyle: styles.text.t2.regular.textColor(styles.theme.blue).textHeight(0),
                  textStyle: styles.text.t2.bold.textColor(styles.theme.grey8).textHeight(0),
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(styles.insets.xxs),
                Text(data.date, style: styles.text.t3.textColor(styles.theme.grey4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
