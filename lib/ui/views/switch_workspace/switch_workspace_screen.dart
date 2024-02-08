/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/switch_workspace_add_button.dart';
import 'components/switch_workspace_header.dart';
import 'components/switch_workspace_selector.dart';

class SwitchWorkspaceScreen extends StatelessWidget {
  const SwitchWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return CustomBottomSheetLayout(
          child: Padding(
            padding: EdgeInsets.all(styles.insets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SwitchWorkspaceHeader(),
                const Gap(16),
                SwitchWorkspaceAddButton(onPressed: () {}),
                Gap(styles.insets.md),
                SwitchWorkspaceSelector(
                  workspaces: store.workspaces,
                  selectedWorkspace: store.workspace ?? store.workspaces.first,
                  onChanged: (value) => store.workspace = value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
