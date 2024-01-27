/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';
import 'components/switch_workspace_add_button.dart';
import 'components/switch_workspace_header.dart';
import 'components/switch_workspace_selector.dart';

class SwitchWorkspaceScreen extends StatelessWidget {
  const SwitchWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(12),
          Center(
            child: Container(
              height: 6,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: context.styles.corners.br8,
                color: kSilver,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.styles.insets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SwitchWorkspaceHeader(),
                const Gap(16),
                SwitchWorkspaceAddButton(onPressed: () {}),
                Gap(context.styles.insets.md),
                SwitchWorkspaceSelector(
                  workspaces: workspaceData,
                  selectedWorkspace: workspaceData.first,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
