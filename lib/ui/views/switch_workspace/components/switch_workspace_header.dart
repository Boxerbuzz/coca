/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SwitchWorkspaceHeader extends BaseStatelessWidget {
  const SwitchWorkspaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Workspace', style: styles(context).text.t1),
        Text('You can switch between workspaces', style: styles(context).text.p.textColor(styles(context).theme.grey4)),
      ],
    );
  }
}
