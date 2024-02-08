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
      decoration: BoxDecoration(color: styles.theme.white, border: Border(top: BorderSide(color: styles.theme.silver))),
      child: Row(
        children: [
          CustomIconButton(icon: Assets.images.icons.attachment, onPressed: () {}, color: styles.theme.grey7),
          const Gap(12),
          CustomIconButton(
            icon: Assets.images.icons.emoticon,
            onPressed: () {},
            color: styles.theme.grey7,
          ),
          Gap(styles.insets.sm),
          Expanded(child: Text('Write a comment...', style: styles.text.caption.textColor(styles.theme.grey4))),
          CustomIconButton(
              icon: Assets.images.icons.send, onPressed: () {}, color: styles.theme.blue, bgColor: styles.theme.grey2),
        ],
      ),
    );
  }
}
