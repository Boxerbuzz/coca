/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'board/project_board_display.dart';
import 'list/project_list_display.dart';
import 'project_filter_button.dart';
import 'project_view_switcher.dart';

class ProjectBody extends StatefulWidget {
  const ProjectBody({super.key});

  @override
  State<ProjectBody> createState() => _ProjectBodyState();
}

class _ProjectBodyState extends State<ProjectBody> {
  final GlobalKey _dropdownKey = GlobalKey(debugLabel: 'display_switch');

  final List<Widget> _displays = [
    const ProjectBoardDisplay(),
    const ProjectListDisplay(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, store, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(styles.insets.md),
              child: Row(
                children: [
                  ProjectViewSwitcher(key: _dropdownKey),
                  Expanded(child: Container()),
                  const ProjectFilterButton(),
                ],
              ),
            ),
            Expanded(
              child: CustomIndexedStack(
                index: store.display == ProjectDisplayEnum.board ? 0 : 1,
                children: _displays,
              ),
            ),
          ],
        );
      },
    );
  }
}
