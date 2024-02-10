/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailDescription extends BaseStatelessWidget {
  const ProjectDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles(context).insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomSvg(Assets.images.icons.description).svg(color: styles(context).theme.grey7),
              const Gap(15),
              Text('Description', style: styles(context).text.t1),
            ],
          ),
          const Gap(13),
          Text(
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...',
            style: styles(context).text.caption,
          ).padding(left: styles(context).insets.lg),
          Gap(styles(context).insets.sm),
          Text(
            'Read more',
            style: styles(context).text.b1.copyWith(color: styles(context).theme.blue),
          ).padding(left: styles(context).insets.lg),
        ],
      ),
    );
  }
}
