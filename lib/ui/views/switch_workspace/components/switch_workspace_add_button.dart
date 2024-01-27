/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class SwitchWorkspaceAddButton extends StatelessWidget {
  const SwitchWorkspaceAddButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: CustomMaterialButton(
        onTap: () {},
        backgroundColor: kGray02,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.plus.svg(color: kGray07),
            Gap(context.styles.insets.sm),
            Text('Add Workspace', style: context.styles.text.b1),
          ],
        ),
      ),
    );
  }
}
