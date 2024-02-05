/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailDescription extends StatelessWidget {
  const ProjectDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles.insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Assets.images.icons.description.svg(width: 20, height: 20),
              const Gap(15),
              Text('Description', style: styles.text.t1),
            ],
          ),
          const Gap(13),
          Text(
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...',
            style: styles.text.p,
          ).padding(left: styles.insets.lg),
          Gap(styles.insets.sm),
          Text(
            'Read more',
            style: styles.text.b1.copyWith(color: styles.theme.blue),
          ).padding(left: styles.insets.lg),
        ],
      ),
    );
  }
}
