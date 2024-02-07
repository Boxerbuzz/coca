/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class MailCategoryItem extends StatelessWidget {
  const MailCategoryItem({super.key, this.value = '', required this.title});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(styles.insets.xs),
      height: 42,
      child: Row(
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(color: styles.theme.red, borderRadius: styles.corners.br4),
          ),
          const Gap(31),
          Text(title, style: styles.text.p.textColor(styles.theme.grey7)),
          const Spacer(),
          Text(value, style: styles.text.p.textColor(styles.theme.grey4)),
        ],
      ),
    );
  }
}
