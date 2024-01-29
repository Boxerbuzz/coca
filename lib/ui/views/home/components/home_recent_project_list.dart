/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'home_recent_project_item.dart';

class HomeRecentProjectList extends StatelessWidget {
  const HomeRecentProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
          child: CustomSubHeader(title: 'Recent Projects', onPressed: () {}),
        ),
        CustomHorizontalScroll(
          curve: Curves.easeIn,
          duration: 2.milliseconds,
          child: Row(
            children: [
              Gap(styles.insets.md),
              ...projects.map((e) => HomeRecentProjectItem(data: e)),
            ],
          ),
        ),
      ],
    );
  }
}
