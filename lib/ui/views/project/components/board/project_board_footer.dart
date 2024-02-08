/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectBoardFooter extends StatelessWidget {
  const ProjectBoardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: styles.theme.grey2,
        border: Border(top: BorderSide(color: styles.theme.silver)),
      ),
      padding: EdgeInsets.symmetric(horizontal: styles.insets.sm, vertical: styles.insets.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            icon: Assets.images.icons.plus,
            onPressed: () {},
            bgColor: Colors.transparent,
            color: styles.theme.grey4,
            iconSize: 12,
            size: 18,
          ),
        ],
      ),
    );
  }
}
