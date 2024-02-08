/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailComments extends StatelessWidget {
  const ProjectDetailComments({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<MainProvider>().user!;
    return Column(
      children: [
        Row(
          children: [
            CustomSvg(Assets.images.icons.message).svg(color: styles.theme.grey7),
            Gap(styles.insets.sm),
            Text('Comments', style: styles.text.t1),
            Expanded(child: Container()),
          ],
        ).padding(all: styles.insets.md, bottom: styles.insets.xxs),
        Gap(styles.insets.sm),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: styles.theme.grey2,
            borderRadius: BorderRadius.circular(styles.corners.md),
          ),
          margin: EdgeInsets.symmetric(horizontal: styles.insets.md),
          padding: EdgeInsets.all(styles.insets.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomAvatar(user: user, size: 34),
                  Gap(styles.insets.xs),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user.firstName} ${user.lastName}', style: styles.text.t2),
                        Text('May 22, 2024', style: styles.text.p.textColor(styles.theme.grey4)),
                      ],
                    ),
                  ),
                  CustomSvg(Assets.images.icons.dots).svg(width: 24, height: 24, color: styles.theme.grey7),
                ],
              ),
              Gap(styles.insets.sm),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat'
                ' duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                style: styles.text.caption,
              ),
            ],
          ),
        ),
        Gap(styles.insets.md),
      ],
    );
  }
}
