/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_tab_indicator.dart';
import 'custom_tab_label.dart';

class CustomTabBar extends StatelessWidget {
  final ValueChanged<int>? onChanged;
  final List<String> sections;
  final int index;
  static const List<String> defaults = ["test", "foo", "bar"];
  const CustomTabBar({super.key, this.sections = defaults, this.index = 0, this.onChanged});

  @override
  Widget build(BuildContext context) {
    /// clickable labels
    List<Widget> clickableLabels = sections.map((e) {
      return CustomTabLabel(
        label: e,
        onPressed: () => onChanged?.call(sections.indexOf(e)),
        isSelected: sections.indexOf(e) == index,
      );
    }).toList();

    /// calculate target alignment for animated bar
    double targetAlignX = -1 + (index * 1 / (sections.length - 1)) * 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: RepaintBoundary(
        child: Stack(
          children: <Widget>[
            /// Outline
            CustomTabIndicator(color: styles.theme.grey3),

            /// Animated bar
            CustomTabIndicator(color: styles.theme.white)
                .fractionallySizedBox(wFactor: 1 / sections.length)
                .alignment(Alignment(targetAlignX, 0), animate: true)
                .padding(all: 4)
                .animate(200.milliseconds, Curves.easeOut),

            /// Clickable Text labels
            Row(children: clickableLabels),
          ],
        ).height(48),
      ),
    );
  }
}
