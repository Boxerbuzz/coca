/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class HomeTaskList extends StatelessWidget {
  const HomeTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Column(
      children: [
        CustomSubHeader(title: "Today's Task", onPressed: () {}),
        const Gap(12),
      ],
    );
  }
}
