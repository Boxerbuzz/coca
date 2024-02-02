/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectViewSwitcher extends StatelessWidget {
  const ProjectViewSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    /// dropdown button content
    Widget content = Container(
      height: 36,
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(borderRadius: styles.corners.br8, border: Border.all(color: styles.theme.silver)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.icons.columns.svg(),
          Text('Board', style: styles.text.b1),
          Icon(Icons.arrow_drop_down, size: styles.sizes.icon, color: styles.theme.grey4),
        ],
      ),
    );

    return CustomDropdownButton(
      buttonBuilder: (_, __) => content,
      menuBuilder: (_, __) {
        return Consumer<MainProvider>(
          builder: (context, store, child) {
            return DropDownListMenu(
              bCenterOriginTabOnPivot: false,
              minHeight: 250,
              originTabBuilder: (_, __) => content,
              children: [
                ...List.generate(10, (index) => Text('dropdown item $index')),
              ],
            );
          },
        );
      },
    );
  }

  void close(BuildContext context) => Navigator.of(context).pop();
}
