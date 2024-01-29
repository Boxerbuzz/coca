/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/widgets/buttons/custom_app_button.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SwitchWorkspaceAddButton extends StatelessWidget {
  const SwitchWorkspaceAddButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: CustomAppButton(
        onPressed: () {},
        bgColor: styles.theme.grey2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.plus.svg(color: styles.theme.grey7),
            Gap(styles.insets.sm),
            Text('Add Workspace', style: styles.text.b1),
          ],
        ),
      ),
    );
  }
}
