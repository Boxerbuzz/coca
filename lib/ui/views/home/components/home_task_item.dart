/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeTaskItem extends BaseStatelessWidget {
  const HomeTaskItem({super.key, required this.data});
  final TaskModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: styles(context).corners.br12,
        color: Colors.white,
        border: Border.all(color: styles(context).theme.silver),
      ),
      padding: EdgeInsets.all(styles(context).insets.md),
      margin: EdgeInsets.only(bottom: styles(context).insets.sm),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(borderRadius: styles(context).corners.br16, color: styles(context).theme.grey2),
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  borderRadius: styles(context).corners.br12,
                  color: data.isCompleted ? styles(context).theme.green : styles(context).theme.silver),
              padding: const EdgeInsets.all(2),
              child: data.isCompleted ? CustomSvg(Assets.images.icons.check).svg() : const SizedBox.shrink(),
            ),
          ),
          Gap(styles(context).insets.btn),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinkifyText(
                  data.title,
                  linkTypes: const [LinkType.userTag],
                  linkStyle: styles(context).text.t2.regular.textColor(styles(context).theme.blue),
                  textStyle: styles(context).text.t2.bold.textColor(styles(context).theme.grey8),
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(styles(context).insets.xs),
                Row(
                  children: [
                    CustomSvg(Assets.images.icons.calendar).svg(),
                    const Gap(8),
                    Text(data.date, style: styles(context).text.t2.textColor(styles(context).theme.grey4).regular),
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
