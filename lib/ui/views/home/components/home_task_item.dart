/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeTaskItem extends StatelessWidget {
  const HomeTaskItem({super.key, required this.data});
  final TaskModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: styles.corners.br12,
        color: Colors.white,
        border: Border.all(color: styles.theme.silver),
      ),
      padding: EdgeInsets.all(styles.insets.md),
      margin: EdgeInsets.only(bottom: styles.insets.sm),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(borderRadius: styles.corners.br16, color: styles.theme.grey2),
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  borderRadius: styles.corners.br12,
                  color: data.isCompleted ? styles.theme.green : styles.theme.silver),
              padding: const EdgeInsets.all(2),
              child: data.isCompleted ? CustomSvg(Assets.images.icons.check).svg() : const SizedBox.shrink(),
            ),
          ),
          Gap(styles.insets.btn),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinkifyText(
                  data.title,
                  linkTypes: const [LinkType.userTag],
                  linkStyle: styles.text.t2.regular.textColor(styles.theme.blue),
                  textStyle: styles.text.t2.bold.textColor(styles.theme.grey8),
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(styles.insets.xs),
                Row(
                  children: [
                    CustomSvg(Assets.images.icons.calendar).svg(),
                    const Gap(8),
                    Text(data.date, style: styles.text.t2.textColor(styles.theme.grey4).regular),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
