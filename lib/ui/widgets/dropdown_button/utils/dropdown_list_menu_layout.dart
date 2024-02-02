/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

/// Layout that places the dropdown within the screen.
class DropDownListMenuLayout<T> extends SingleChildLayoutDelegate {
  DropDownListMenuLayout({required this.position});

  final Offset position;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return position;
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
