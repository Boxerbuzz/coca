/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'switch_workspace_item.dart';

class SwitchWorkspaceSelector extends StatefulWidget {
  const SwitchWorkspaceSelector({super.key, this.workspaces, required this.selectedWorkspace, required this.onChanged});
  final List<WorkspaceModel>? workspaces;
  final WorkspaceModel selectedWorkspace;
  final ValueChanged<WorkspaceModel> onChanged;

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
    return Column(
      children: [
        ...workspacesData.map(
          (e) => Padding(
            padding: EdgeInsets.only(bottom: styles.insets.btn),
            child: SwitchWorkspaceItem(
              isSelected: e == _selectedWorkspace,
              workspace: e,
              onPressed: () {
                setState(() {
                  if (_selectedWorkspace != e) {
                    _selectedWorkspace = e;
                    widget.onChanged(e);
                  }
                  context.pop();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
