/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

/// A button that uses a builder function to open a dropdown list modal when pressed.
class CustomDropdownButton<ItemType> extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
    required this.buttonBuilder,
    required this.menuBuilder,
    this.openRectExtraSpace = EdgeInsets.zero,
    this.bStretchDropdown = false,
    this.tooltipMessage,
  });

  /// Function that builds the button based on the dropdown [state].
  final Widget Function(BuildContext context, DropdownButtonStateEnum state) buttonBuilder;

  /// Function that builds the dropdown menu.
  /// Receives an [originTabBuilder] function which will build the menu's origin tab based on whether the tab [isOnTop].
  final Widget Function(BuildContext context, Widget Function(BuildContext, bool isOnTop) originTabBuilder) menuBuilder;

  /// How much space to add around the original button's bounding area when building its open version.
  final EdgeInsets openRectExtraSpace;

  /// Whether to stretch the dropdown to match the size of the button.
  final bool bStretchDropdown;

  /// An optional tooltip message to show when the button is hovered or long pressed.
  final String? tooltipMessage;

  @override
  State<CustomDropdownButton<ItemType>> createState() => _CustomDropdownButtonState<ItemType>();
}

class _CustomDropdownButtonState<ItemType> extends State<CustomDropdownButton<ItemType>> {
  /// Key used to identify the widget from which the dropdown originates.
  final GlobalKey _dropdownOriginator = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final button = Semantics(
      button: true,
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: GestureDetector(
          key: _dropdownOriginator,
          onTap: _onTap,
          child: widget.buttonBuilder(context, DropdownButtonStateEnum.closed),
        ),
      ),
    );

    return (widget.tooltipMessage != null) ? Tooltip(message: widget.tooltipMessage, child: button) : button;
  }

  /// Called when this is tapped.
  void _onTap() {
    final RenderObject? widgetRenderObject = _dropdownOriginator.currentContext?.findRenderObject();
    final RenderBox? widgetBox = (widgetRenderObject != null) ? (widgetRenderObject as RenderBox) : null;

    if (widgetBox == null) {
      throw Exception('Failed to find widget render box for $this');
    }

    final RenderObject rootRenderObject = context.findRenderObject()!;

    double width = widgetBox.size.width + widget.openRectExtraSpace.horizontal;
    double height = widgetBox.size.height + widget.openRectExtraSpace.vertical;

    final Size size = Size(width, height);

    Offset point = Offset(-widget.openRectExtraSpace.left, -widget.openRectExtraSpace.bottom);

    /// global position
    final Offset position = widgetBox.localToGlobal(point, ancestor: rootRenderObject);

    final Rect widgetRect = Rect.fromLTWH(position.dx, position.dy, size.width, size.height);

    DropDownListMenu.showAtRect(
      context,
      pRect: widgetRect,
      bStretch: widget.bStretchDropdown,
      builder: (context) => widget.menuBuilder(
        context,
        (context, bIsOnTop) {
          DropdownButtonStateEnum state = bIsOnTop ? DropdownButtonStateEnum.top : DropdownButtonStateEnum.bottom;
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widgetRect.width, maxHeight: widgetRect.height),
            child: widget.buttonBuilder(context, state),
          );
        },
      ),
    );
  }
}

typedef DropDownListMenuBuilder = Widget Function(BuildContext context);
