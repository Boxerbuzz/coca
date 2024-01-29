/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'home_stat_item.dart';

class HomeWorkspaceStats extends StatelessWidget {
  const HomeWorkspaceStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          ...stats.map(
            (e) => StaggeredGridTile.count(
              crossAxisCellCount: e.cross,
              mainAxisCellCount: e.main,
              child: StatTile(index: e.index, data: e),
            ),
          )
        ],
      ),
    );
  }
}

class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.index, this.extent, required this.data});
  final int index;
  final double? extent;
  final StatModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: extent,
      child: HomeStatItem(color: data.color, title: data.label, stats: data.stat, isMini: data.isMini, icon: data.icon),
    );
  }
}
