/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'project_detail_info_with_label.dart';

class ProjectDetailInfo extends BaseStatelessWidget {
  const ProjectDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md, vertical: styles(context).insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Design Dashboard and UI Kit', style: styles(context).text.t1),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ProjectDetailInfoWithLabel(
                  title: 'Assigned to',
                  childValue: CustomAvatarPile(users: participants(count: 2), size: 24),
                ),
              ),
              const Expanded(
                child: ProjectDetailInfoWithLabel(title: 'Due Date', value: 'Fri, 15 Jul 2022'),
              ),
            ],
          ),
          Gap(styles(context).insets.md),
          Row(
            children: [
              Expanded(
                child: ProjectDetailInfoWithLabel(
                  title: 'Priority',
                  childValue: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSvg(Assets.images.icons.flag).svg(width: 16, height: 16),
                      Gap(styles(context).insets.xxs),
                      Text('Urgent', style: styles(context).text.t2).padding(bottom: 4),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ProjectDetailInfoWithLabel(
                  title: 'Status',
                  childValue: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 12,
                          height: 12,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: styles(context).theme.silver, borderRadius: BorderRadius.circular(2))),
                      Gap(styles(context).insets.xxs),
                      Text('🗒  BACKLOG', style: styles(context).text.t2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
