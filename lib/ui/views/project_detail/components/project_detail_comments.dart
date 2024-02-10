/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailComments extends BaseStatelessWidget {
  const ProjectDetailComments({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<MainProvider>().user!;
    return Column(
      children: [
        Row(
          children: [
            CustomSvg(Assets.images.icons.message).svg(color: styles(context).theme.grey7),
            Gap(styles(context).insets.sm),
            Text('Comments', style: styles(context).text.t1),
            Expanded(child: Container()),
          ],
        ).padding(all: styles(context).insets.md, bottom: styles(context).insets.xxs),
        Gap(styles(context).insets.sm),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: styles(context).theme.grey2,
            borderRadius: BorderRadius.circular(styles(context).corners.md),
          ),
          margin: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
          padding: EdgeInsets.all(styles(context).insets.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomAvatar(user: user, size: 34),
                  Gap(styles(context).insets.xs),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user.firstName} ${user.lastName}', style: styles(context).text.t2),
                        Text('May 22, 2024', style: styles(context).text.p.textColor(styles(context).theme.grey4)),
                      ],
                    ),
                  ),
                  CustomSvg(Assets.images.icons.dots).svg(width: 24, height: 24, color: styles(context).theme.grey7),
                ],
              ),
              Gap(styles(context).insets.sm),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat'
                ' duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                style: styles(context).text.caption,
              ),
            ],
          ),
        ),
        Gap(styles(context).insets.md),
      ],
    );
  }
}
