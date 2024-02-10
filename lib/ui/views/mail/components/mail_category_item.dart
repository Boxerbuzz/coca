/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class MailCategoryItem extends BaseStatelessWidget {
  const MailCategoryItem({super.key, this.value = '', required this.title, this.color});

  final String title;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(styles(context).insets.xs),
      height: 42,
      child: Row(
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: color ?? styles(context).theme.red,
              borderRadius: styles(context).corners.br4,
            ),
          ),
          const Gap(31),
          Text(title, style: styles(context).text.p.textColor(styles(context).theme.grey7)),
          const Spacer(),
          Text(value, style: styles(context).text.p.textColor(styles(context).theme.grey4)),
        ],
      ),
    );
  }
}
