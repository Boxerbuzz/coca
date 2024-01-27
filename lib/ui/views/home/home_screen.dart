/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';
import 'components/home_task_list.dart';
import 'components/home_workspace_switcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: context.styles.insets.md),
      child: Column(
        children: [
          HomeWorkspaceSwitcher(),
          HomeTaskList(),
        ],
      ),
    );
  }
}
