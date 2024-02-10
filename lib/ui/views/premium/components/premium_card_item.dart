/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class PremiumCardItem extends BaseStatelessWidget {
  const PremiumCardItem({super.key, required this.text, required this.icon, required this.subTittle});
  final String text;
  final String icon;
  final String subTittle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: styles(context).insets.sm),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: styles(context).corners.br24, color: styles(context).theme.grey2),
            child: CustomSvg(icon).svg(width: 24, height: 24, color: styles(context).theme.blue),
          ),
          Gap(styles(context).insets.btn),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: styles(context).text.t2.thick),
              Text(subTittle, style: styles(context).text.p.textColor(styles(context).theme.grey4)),
            ],
          )
        ],
      ),
    );
  }
}
