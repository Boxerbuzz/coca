/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailCommentBlock extends BaseStatelessWidget {
  const ProjectDetailCommentBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.sm),
      decoration: BoxDecoration(
          color: styles(context).theme.white, border: Border(top: BorderSide(color: styles(context).theme.silver))),
      child: Row(
        children: [
          CustomIconButton(icon: Assets.images.icons.attachment, onPressed: () {}),
          const Gap(12),
          CustomIconButton(icon: Assets.images.icons.emoticon, onPressed: () {}),
          Gap(styles(context).insets.sm),
          Expanded(
              child: Text('Write a comment...',
                  style: styles(context).text.caption.textColor(styles(context).theme.grey4))),
          CustomIconButton(
            icon: Assets.images.icons.send,
            onPressed: () {},
            color: styles(context).theme.blue,
            bgColor: styles(context).theme.grey2,
          ),
        ],
      ),
    );
  }
}
