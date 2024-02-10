/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/app_bar/custom_back_button.dart';

class CreateTaskHeader extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CreateTaskHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: EdgeInsets.only(right: styles(context).insets.md),
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles(context).theme.white, boxShadow: styles(context).shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBackButton.close(),
            Expanded(child: Center(child: Text('Create New Task', style: styles(context).text.t1))),
            CustomIconButton(icon: Assets.images.icons.alt, onPressed: () {}),
          ],
        ),
      );
}
