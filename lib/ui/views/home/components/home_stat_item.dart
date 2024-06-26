/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'home_stat_icon.dart';
import 'home_stat_label.dart';

class HomeStatItem extends BaseStatelessWidget {
  const HomeStatItem({super.key, this.color, this.title = '', required this.icon, this.stats = '', this.isMini = true});
  final Color? color;
  final String title;
  final String stats;
  final String icon;
  final bool isMini;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: styles(context).corners.br12,
        color: styles(context).theme.white,
        border: Border.all(color: styles(context).theme.silver),
      ),
      padding: EdgeInsets.all(styles(context).insets.sm),
      child: isMini
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeStatLabel(label: title, stats: stats),
                const Spacer(),
                HomeStatIcon(icon: icon, color: color)
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeStatIcon(icon: icon, color: color),
                const Spacer(),
                HomeStatLabel(label: title, stats: stats)
              ],
            ),
    );
  }
}
