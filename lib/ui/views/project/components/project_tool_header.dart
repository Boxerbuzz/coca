/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'project_add_board_button.dart';
import 'project_filter_button.dart';
import 'project_view_switcher.dart';

class ProjectToolHeader extends BaseStatelessWidget {
  const ProjectToolHeader({super.key});

  static final GlobalKey _dropdownKey = GlobalKey(debugLabel: 'display_switch');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles(context).insets.md),
      child: Row(
        children: [
          ProjectViewSwitcher(key: _dropdownKey),
          Expanded(child: Container()),
          const ProjectFilterButton(),
          Gap(styles(context).insets.xs),
          const ProjectAddBoardButton(),
        ],
      ),
    );
  }
}
