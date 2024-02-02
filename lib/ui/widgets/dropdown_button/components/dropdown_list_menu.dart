/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_dropdown_button.dart';
import '../model/dropdown_list_placement_model.dart';
import '../utils/dropdown_list_menu_layout.dart';
import '../utils/list_menu_edge_direction_enum.dart';
import 'dropdown_list.dart';
import 'dropdown_list_menu_route.dart';
import 'measurable.dart';

/// A modal drop-down list menu that can be placed at an arbitrary position on the screen.
class DropDownListMenu extends StatefulWidget {
  const DropDownListMenu(
      {Key? widgetKey,
      required this.children,
      this.originTabBuilder,
      this.bCenterOriginTabOnPivot = false,
      this.minHeight = 0,
      this.bIsScrollable = true})
      : super(key: widgetKey);

  final bool bIsScrollable;

  /// Items in the list.
  final List<Widget> children;

  /// Optional builder for an extra widget to display on top of/underneath the menu.
  /// This will be positioned to line up with the menu's origin point.
  final Widget Function(BuildContext context, bool bIsOnTop)? originTabBuilder;

  /// If true, position the menu with the origin tab built by [originTabBuilder] centered on the center of the pivot.
  final bool bCenterOriginTabOnPivot;

  /// The list's minimum height. If list would extend off the screen, it will be constrained to this height at minimum
  /// and add a scroll bar.
  final double minHeight;

  /// Show a drop-down menu originating from the given pivot rect [pRect] and created using the [builder]. It will be
  /// automatically placed at the side of the rectangle with the most space.
  static void showAtRect(
    BuildContext context, {
    required Rect pRect,
    required DropDownListMenuBuilder builder,
    bool bStretch = false,
    void Function()? onPopped,
  }) {
    final route = DropDownListMenuRoute(
      placement: DropDownListPlacementModel(bStretch: bStretch, pivotRect: pRect),
      builder: builder,
    );

    if (onPopped != null) {
      route.popped.then((_) => onPopped());
    }

    Navigator.of(context, rootNavigator: true).push<void>(route);
  }

  @override
  State<StatefulWidget> createState() => _DropDownListMenuState();
}

class _DropDownListMenuState extends State<DropDownListMenu> {
  Size? _menuSize;
  Size? _menuSizeWithScrollbar;
  Size? _originTabSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<DropDownListPlacementModel>(
      builder: (context, dropdownData, _) {
        if (_menuSize == null) {
          // Build once so we can determine the menu's size. Use Align here so the menu doesn't expand to fill the entire
          // screen. This assumes that the menu won't change size on the next build (e.g. if its edgeDirection changes).
          return Offstage(
            child: Align(
              child: Stack(
                children: [
                  if (widget.originTabBuilder != null)
                    Measurable(onMeasured: _onOriginTabMeasured, child: widget.originTabBuilder!(context, true)),
                  Measurable(onMeasured: _onMenuMeasured, child: DropdownList(children: widget.children)),
                  Measurable(onMeasured: _onMenuWithScrollBarMeasured, child: DropdownList(children: widget.children)),
                ],
              ),
            ),
          );
        }

        if (_menuSize == null || _menuSizeWithScrollbar == null || _originTabSize == null) {
          // Still waiting for initial build to be measured
          return const SizedBox();
        }

        final Size screenSize = MediaQuery.of(context).size;
        final EdgeInsets screenPadding = MediaQuery.of(context).viewPadding;

        late final Rect pivotRect;
        late final Offset initialPosition;

        if (widget.bCenterOriginTabOnPivot) {
          pivotRect = dropdownData.pivotRect.center & Size.zero;
          initialPosition = pivotRect.center + Offset(-_originTabSize!.width / 2, _originTabSize!.height / 2);
        } else {
          pivotRect = dropdownData.pivotRect;
          initialPosition = pivotRect.bottomLeft;
        }

        // Adjust Y position if we would extend off the bottom of the screen
        // Max Y coordinate of menu's bottom
        final double bottomLimit = screenSize.height - screenPadding.bottom;

        // Actual Y coordinate of menu's bottom
        final double menuBottom = initialPosition.dy + widget.minHeight;

        // The height of the menu, which we will apply constraints to as necessary to fit on-screen
        double menuHeight = _menuSize!.height;

        bool bIsOriginTop = true;
        double yPosition = initialPosition.dy;

        if (menuBottom > bottomLimit) {
          // Display the menu above the pivot instead of below
          bIsOriginTop = false;

          if (widget.bCenterOriginTabOnPivot) {
            yPosition -= _menuSize!.height + _originTabSize!.height;
          } else {
            yPosition -= _menuSize!.height + pivotRect.height;
          }

          if (yPosition < 0) {
            // Shrink menu to fit on screen
            menuHeight += yPosition;
            yPosition = 0;
          }
        } else {
          // Clamp height in bounds of screen
          menuHeight = menuHeight.clamp(widget.minHeight, bottomLimit - yPosition);
        }

        // Adjust Y position to accommodate origin tab
        if (_originTabSize != null && bIsOriginTop) {
          yPosition -= _originTabSize!.height;
        }

        // Minimum menu width so rounded border lines up with edge
        double minMenuWidth = 240;
        if (_originTabSize != null && !dropdownData.bStretch) {
          minMenuWidth = _originTabSize!.width + DropdownList.borderRadius.x;
        }

        final bool bWillScroll = menuHeight < _menuSize!.height;
        final double menuWidth = max(minMenuWidth, bWillScroll ? _menuSizeWithScrollbar!.width : _menuSize!.width);

        // Adjust X position if we would extend off the right of the screen
        bool bIsOriginLeft = true;
        double xPosition = initialPosition.dx;

        if (!dropdownData.bStretch) {
          if (xPosition < screenPadding.left) {
            xPosition = screenPadding.left;
          } else {
            // Push menu to the left if the dropdown would cross the right edge of the safe area
            final double rightLimit = screenSize.width - screenPadding.left;
            final double menuRight = xPosition + menuWidth;

            if (menuRight > rightLimit) {
              // Display menu to left of pivot instead of right
              if (widget.bCenterOriginTabOnPivot) {
                xPosition -= menuWidth - _originTabSize!.width;
              } else {
                xPosition -= menuWidth - pivotRect.width;
              }
              bIsOriginLeft = false;

              // Move the menu left to fit on-screen
              final double newRight = xPosition + menuWidth;
              if (newRight > rightLimit) {
                xPosition -= newRight - rightLimit;
              }
            }
          }
        }

        late final ListMenuEdgeDirectionEnum edgeDirection;
        if (bIsOriginTop) {
          if (dropdownData.bStretch) {
            edgeDirection = ListMenuEdgeDirectionEnum.top;
          } else if (bIsOriginLeft) {
            edgeDirection = ListMenuEdgeDirectionEnum.topLeft;
          } else {
            edgeDirection = ListMenuEdgeDirectionEnum.topRight;
          }
        } else {
          if (dropdownData.bStretch) {
            edgeDirection = ListMenuEdgeDirectionEnum.bottom;
          } else if (bIsOriginLeft) {
            edgeDirection = ListMenuEdgeDirectionEnum.bottomLeft;
          } else {
            edgeDirection = ListMenuEdgeDirectionEnum.bottomRight;
          }
        }

        // Create the origin tab if necessary
        late final Widget? originTab;
        if (widget.originTabBuilder != null) {
          // Ignore the pointer so tapping the tab also closes the dropdown
          originTab = IgnorePointer(
            child: widget.originTabBuilder!(context, bIsOriginTop),
          );
        } else {
          originTab = null;
        }

        // Create the contents of the dropdown menu.
        Widget listWidget = DropdownList(
            minWidth: dropdownData.bStretch ? pivotRect.width : 0,
            maxWidth: dropdownData.bStretch ? pivotRect.width : double.infinity,
            edgeDirection: edgeDirection,
            children: widget.children);

        // Wrap with scrolling view
        if (bWillScroll) {
          listWidget = SizedBox(height: menuHeight, width: menuWidth, child: listWidget);
        }

        return CustomSingleChildLayout(
          delegate: DropDownListMenuLayout(position: Offset(xPosition, yPosition)),
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: bIsOriginLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  if (bIsOriginTop && originTab != null) originTab,
                  ConstrainedBox(constraints: BoxConstraints(minWidth: minMenuWidth), child: listWidget),
                  if (!bIsOriginTop && originTab != null) originTab,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onMenuMeasured(Size size) {
    if (_menuSize != size) {
      setState(() {
        _menuSize = size;
      });
    }
  }

  void _onMenuWithScrollBarMeasured(Size size) {
    if (_menuSizeWithScrollbar != size) {
      setState(() {
        _menuSizeWithScrollbar = size;
      });
    }
  }

  void _onOriginTabMeasured(Size size) {
    if (_originTabSize != size) {
      setState(() {
        _originTabSize = size;
      });
    }
  }
}
