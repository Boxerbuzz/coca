/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/app_bar/custom_back_button.dart';

class MailDetailHeader extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const MailDetailHeader({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        margin: EdgeInsets.only(top: context.mq.padding.top),
        decoration: BoxDecoration(color: styles(context).theme.white, boxShadow: styles(context).shadows.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(styles(context).insets.xxs),
            const CustomBackButton(),
            Expanded(child: Container()),
            CustomIconButton(icon: Assets.images.editor.undo, onPressed: () {}),
            CustomIconButton(icon: Assets.images.icons.trash, onPressed: () {}),
            CustomIconButton(icon: Assets.images.icons.dots, onPressed: () {}),
            Gap(styles(context).insets.sm),
          ],
        ),
      );
}
