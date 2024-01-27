/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'switch_workspace_item.dart';

class SwitchWorkspaceSelector extends StatefulWidget {
  const SwitchWorkspaceSelector({super.key, this.workspaces, this.selectedWorkspace});
  final List<WorkspaceModel>? workspaces;
  final WorkspaceModel? selectedWorkspace;

  @override
  State<SwitchWorkspaceSelector> createState() => _SwitchWorkspaceSelectorState();
}

class _SwitchWorkspaceSelectorState extends State<SwitchWorkspaceSelector> {
  WorkspaceModel? _selectedWorkspace;

  @override
  void initState() {
    _selectedWorkspace = widget.selectedWorkspace;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return Column(
          children: [
            ...workspaceData.map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: context.styles.insets.btn),
                child: SwitchWorkspaceItem(
                  isSelected: e == _selectedWorkspace,
                  workspace: e,
                  onPressed: () {
                    setState(() {
                      _selectedWorkspace = e;
                    });
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
