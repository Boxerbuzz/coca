/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';
import 'project_board_stat_item.dart';

class ProjectBoardCard extends BaseStatelessWidget {
  const ProjectBoardCard({super.key, required this.data});
  final ProjectModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles(context).insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(data.name, style: styles(context).text.b1),
          Gap(styles(context).insets.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProjectBoardStatItem(icon: Assets.images.icons.attachment, value: '0'),
              Gap(styles(context).insets.md),
              ProjectBoardStatItem(icon: Assets.images.icons.checkSquare, value: '0/${data.tasks.length}'),
              const Spacer(),
              Text('3 days left', style: styles(context).text.b2.textColor(styles(context).theme.red))
            ],
          ),
          const Gap(30),
          Row(
            children: [
              Expanded(child: CustomAvatarPile(users: data.participants, size: 30)),
              Expanded(
                child: Row(
                  children: [
                    CustomSvg(Assets.images.icons.bars).svg(),
                    Gap(styles(context).insets.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${double.parse('${data.progress * 100}').round()}%', style: styles(context).text.t1),
                          CustomLinearProgress(percentage: data.progress * 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
