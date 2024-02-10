/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/widgets/buttons/custom_app_button.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SwitchWorkspaceAddButton extends BaseStatelessWidget {
  const SwitchWorkspaceAddButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CustomAppButton(
        onPressed: () {},
        bgColor: styles(context).theme.grey2,
        padding: EdgeInsets.all(styles(context).insets.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvg(Assets.images.icons.plus).svg(color: styles(context).theme.grey7),
            Gap(styles(context).insets.sm),
            Text('Add Workspace', style: styles(context).text.b1.textColor(styles(context).theme.grey7)),
          ],
        ),
      ),
    );
  }
}
