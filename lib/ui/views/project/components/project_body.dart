/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'board/project_board_display.dart';
import 'list/project_list_display.dart';
import 'project_tool_header.dart';

class ProjectBody extends BaseStatelessWidget {
  const ProjectBody({super.key});

  final List<Widget> _displays = const [ProjectBoardDisplay(), ProjectListDisplay()];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, store, child) {
        return Column(
          children: [
            const ProjectToolHeader(),
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
