/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';

class TaskCalendarHeader extends BaseStatelessWidget {
  const TaskCalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md, vertical: styles(context).insets.sm),
      decoration: BoxDecoration(
        color: styles(context).theme.white,
        border: Border.symmetric(horizontal: BorderSide(color: styles(context).theme.silver)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Jan, 2024', style: styles(context).text.t1),
          const Spacer(),
          CustomButtonWithIcon(
            icon: Assets.images.icons.alignCenter,
            text: 'Filter',
            onPressed: () {},
            border: BorderSide(color: styles(context).theme.silver),
            shrinkWrap: true,
            btnColor: Colors.white,
            iconColor: styles(context).theme.grey4,
            txtColor: styles(context).theme.grey7,
          ),
        ],
      ),
    );
  }
}
