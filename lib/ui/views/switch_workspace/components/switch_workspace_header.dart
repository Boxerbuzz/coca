/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SwitchWorkspaceHeader extends StatelessWidget {
  const SwitchWorkspaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Workspace', style: styles.text.t1),
        Text('You can switch between workspaces', style: styles.text.p.textColor(styles.theme.grey4)),
      ],
    );
  }
}