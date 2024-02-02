/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';

class TaskCalendarHeader extends StatelessWidget {
  const TaskCalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md, vertical: styles.insets.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Jan, 2024', style: styles.text.t1),
          const Spacer(),
          CustomButtonWithIcon(
            icon: Assets.images.icons.alignCenter.path,
            text: 'Filter',
            onPressed: () {},
            border: BorderSide(color: styles.theme.silver),
            shrinkWrap: true,
            btnColor: Colors.white,
            iconColor: styles.theme.grey4,
            txtColor: styles.theme.grey7,
          ),
        ],
      ),
    );
  }
}
