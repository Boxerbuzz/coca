/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:ui';

/// Holds data about how a dropdown list should be placed on-screen.
class DropDownListPlacementModel {
  const DropDownListPlacementModel({required this.pivotRect, required this.bStretch});

  /// The rectangle next to which the dropdown should be placed.
  final Rect pivotRect;

  /// Whether the menu should be stretched to fit the pivot rectangle along the opposite axis to [pivotAxis].
  final bool bStretch;
}
