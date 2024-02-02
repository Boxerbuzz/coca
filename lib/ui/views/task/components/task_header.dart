/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class TaskHeader extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const TaskHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles.theme.white, boxShadow: styles.shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('My Task', style: styles.text.h2.textColor(styles.theme.grey7)),
            Expanded(child: Container()),
            Assets.images.icons.search.svg(height: 20, width: 20),
          ],
        ),
      );
}