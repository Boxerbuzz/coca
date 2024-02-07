/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailCommentBlock extends StatelessWidget {
  const ProjectDetailCommentBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(horizontal: styles.insets.sm),
      child: Row(
        children: [
          CustomIconButton(icon: Assets.images.icons.attachment.path, onPressed: () {}, color: styles.theme.grey4),
          const Gap(12),
          CustomIconButton(icon: Assets.images.icons.emoticon.path, onPressed: () {}, color: styles.theme.grey4),
          Gap(styles.insets.sm),
          Expanded(child: Text('Write a comment...', style: styles.text.p.textColor(styles.theme.grey4))),
          CustomIconButton(
            icon: Assets.images.icons.send.path,
            onPressed: () {},
            color: styles.theme.blue,
            bgColor: styles.theme.grey2,
            size: 50,
          ),
        ],
      ),
    );
  }
}
