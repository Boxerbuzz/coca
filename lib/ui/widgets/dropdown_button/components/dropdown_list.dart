/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../utils/list_menu_edge_direction_enum.dart';

/// A menu containing a vertical list of items.
class DropdownList extends StatelessWidget {
  const DropdownList({
    Key? widgetKey,
    required this.items,
    this.edgeDirection = ListMenuEdgeDirectionEnum.none,
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.minHeight = 0,
    this.padding = EdgeInsets.zero,
    this.separator,
  }) : super(key: widgetKey);

  /// Widgets to show in the list.
  final List<Widget> items;

  /// Which edge of the menu to flatten. Regardless of value, the menu will be the same size.
  final ListMenuEdgeDirectionEnum edgeDirection;

  /// The minimum width of the menu.
  final double minWidth;

  /// The maximum width of the menu.
  final double maxWidth;

  /// The minimum height of the menu.
  final double minHeight;

  final EdgeInsets? padding;

  final Widget? separator;

  /// Radius of the list menu's borders.
  static const Radius borderRadius = Radius.circular(8);

  @override
  Widget build(BuildContext context) {
    late final BorderRadius boxBorderRadius = BorderRadius.only(
      topLeft: (edgeDirection != ListMenuEdgeDirectionEnum.topLeft && edgeDirection != ListMenuEdgeDirectionEnum.top)
          ? borderRadius
          : Radius.zero,
      topRight: (edgeDirection != ListMenuEdgeDirectionEnum.topRight && edgeDirection != ListMenuEdgeDirectionEnum.top)
          ? borderRadius
          : Radius.zero,
      bottomLeft:
          (edgeDirection != ListMenuEdgeDirectionEnum.bottomLeft && edgeDirection != ListMenuEdgeDirectionEnum.bottom)
              ? borderRadius
              : Radius.zero,
      bottomRight:
          (edgeDirection != ListMenuEdgeDirectionEnum.bottomRight && edgeDirection != ListMenuEdgeDirectionEnum.bottom)
              ? borderRadius
              : Radius.zero,
    );

    List<Widget> children = [];

    for (int i = 0; i < items.length; i++) {
      children.add(items[i]);
      if (i < items.length - 1) {
        children.add(separator ?? const SizedBox.shrink());
      }
    }

    Widget contents = IntrinsicWidth(
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
    );

    return Container(
      constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth, minHeight: minHeight),
      decoration: BoxDecoration(color: styles.theme.white, borderRadius: boxBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: SingleChildScrollView(padding: padding, child: contents),
    );
  }
}
