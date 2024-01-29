/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeRecentProjectItem extends StatelessWidget {
  const HomeRecentProjectItem({super.key, required this.data});
  final ProjectModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 266,
      height: 131,
      decoration: BoxDecoration(
        borderRadius: styles.corners.br12,
        color: Colors.white,
        border: Border.all(color: styles.theme.silver),
      ),
      padding: EdgeInsets.all(styles.insets.sm),
      margin: EdgeInsets.only(right: styles.insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.name, style: styles.text.t1, overflow: TextOverflow.ellipsis),
          Row(
            children: [
              Text(data.access, style: styles.text.p.textColor(styles.theme.grey4)),
              const Gap(6),
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(color: styles.theme.grey4, borderRadius: styles.corners.br4),
              ),
              const Gap(6),
              Text('3 days left', style: styles.text.b2.textColor(styles.theme.red)),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: CustomAvatarPile(users: data.participants, size: 28, overlap: .4)),
              Text('${data.progress.round()}%', style: styles.text.b1),
              Gap(styles.insets.xs),
              Expanded(child: CustomLinearProgress(percentage: data.progress))
            ],
          )
        ],
      ),
    );
  }
}
