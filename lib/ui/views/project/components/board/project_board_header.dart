/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectBoardHeader extends BaseStatelessWidget {
  const ProjectBoardHeader(this.title, {super.key, this.onMorePressed});
  final String title;
  final VoidCallback? onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles(context).insets.sm),
      child: Row(
        children: [
          Text(title, style: styles(context).text.t2.textColor(styles(context).theme.grey4)),
          const Spacer(),
          CustomSvg(Assets.images.icons.dots).svg().clickable(onMorePressed),
        ],
      ),
    );
  }
}
