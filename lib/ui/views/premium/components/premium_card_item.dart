/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class PremiumCardItem extends StatelessWidget {
  const PremiumCardItem({super.key, required this.text, required this.icon, required this.subTittle});
  final String text;
  final String icon;
  final String subTittle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: styles.insets.sm),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: styles.corners.br24, color: styles.theme.grey2),
            child: SvgGenImage(icon).svg(width: 24, height: 24, color: styles.theme.blue),
          ),
          Gap(styles.insets.btn),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: styles.text.t2.thick),
              Text(subTittle, style: styles.text.p.textColor(styles.theme.grey4)),
            ],
          )
        ],
      ),
    );
  }
}
