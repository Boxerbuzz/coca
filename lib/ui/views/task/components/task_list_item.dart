/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class TaskListItem extends BaseStatelessWidget {
  const TaskListItem({super.key, required this.data});
  final TaskModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: styles(context).theme.silver), borderRadius: styles(context).corners.br12),
      padding: EdgeInsets.all(styles(context).insets.sm),
      margin: EdgeInsets.only(bottom: styles(context).insets.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(borderRadius: styles(context).corners.br4, color: styles(context).theme.silver),
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
                  linkStyle: styles(context).text.t2.regular.textColor(styles(context).theme.blue).textHeight(0),
                  textStyle: styles(context).text.t2.bold.textColor(styles(context).theme.grey8).textHeight(0),
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(styles(context).insets.xxs),
                Text(data.date, style: styles(context).text.t3.textColor(styles(context).theme.grey4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
