/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/coca.dart';
import 'package:flutter/material.dart';

class SwitchWorkspaceAddButton extends StatelessWidget {
  const SwitchWorkspaceAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      onTap: () {},
      backgroundColor: kGray02,
      child: Row(
        children: [
          Assets.images.icons.plus.svg(),
          Gap(context.styles.insets.sm),
          Text('Add Workspace', style: context.styles.text.b1),
        ],
      ),
    );
  }
}
