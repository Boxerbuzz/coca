/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeRecentProjectItem extends BaseStatelessWidget {
  const HomeRecentProjectItem({super.key, required this.data});
  final ProjectModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 266,
      height: 131,
      decoration: BoxDecoration(
        borderRadius: styles(context).corners.br12,
        color: Colors.white,
        border: Border.all(color: styles(context).theme.silver),
      ),
      padding: EdgeInsets.all(styles(context).insets.sm),
      margin: EdgeInsets.only(right: styles(context).insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.name, style: styles(context).text.t1, overflow: TextOverflow.ellipsis),
          Row(
            children: [
              Text(data.access, style: styles(context).text.p.textColor(styles(context).theme.grey4)),
              const Gap(6),
              Container(
                height: 4,
                width: 4,
                decoration:
                    BoxDecoration(color: styles(context).theme.grey4, borderRadius: styles(context).corners.br4),
              ),
              const Gap(6),
              Text('3 days left', style: styles(context).text.b2.textColor(styles(context).theme.red)),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: CustomAvatarPile(users: data.participants, size: 28, overlap: .4)),
              Text('${data.progress.round()}%', style: styles(context).text.b1),
              Gap(styles(context).insets.xs),
              Expanded(child: CustomLinearProgress(percentage: data.progress))
            ],
          )
        ],
      ),
    );
  }
}
