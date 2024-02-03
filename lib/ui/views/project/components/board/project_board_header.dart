/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectBoardHeader extends StatelessWidget {
  const ProjectBoardHeader(this.title, {super.key, this.onMorePressed});
  final String title;
  final VoidCallback? onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles.insets.sm),
      child: Row(
        children: [
          Text(title, style: styles.text.t1.textColor(styles.theme.grey4)),
          const Spacer(),
          Assets.images.icons.dots.svg().clickable(onMorePressed),
        ],
      ),
    );
  }
}
