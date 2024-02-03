/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';
import 'project_board_stat_item.dart';

class ProjectBoardCard extends StatelessWidget {
  const ProjectBoardCard({super.key, required this.data});
  final ProjectModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles.insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(data.name, style: styles.text.b1),
          Gap(styles.insets.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProjectBoardStatItem(icon: Assets.images.icons.attachment.path, value: '0'),
              Gap(styles.insets.md),
              ProjectBoardStatItem(icon: Assets.images.icons.checkSquare.path, value: '0/${data.tasks.length}'),
              const Spacer(),
              Text('3 days left', style: styles.text.b2.textColor(styles.theme.red))
            ],
          ),
          const Gap(30),
          Row(
            children: [
              Expanded(child: CustomAvatarPile(users: data.participants, size: 30)),
              Expanded(
                child: Row(
                  children: [
                    Assets.images.icons.bars.svg(),
                    Gap(styles.insets.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${double.parse('${data.progress * 100}').round()}%', style: styles.text.t1),
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
