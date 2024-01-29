/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'styles_definition.dart';

@immutable
class CustomAppStyles {
  CustomAppStyles({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = .9; // phone
    } else {
      scale = .85; // small phone
    }
    debugPrint('screenSize=$screenSize, scale=$scale');
  }

  late final double scale;

  /// The current theme colors for the app
  final AppTheme theme = AppTheme();

  /// Rounded edge corner radii
  late final Corners corners = Corners();

  late final Shadows shadows = Shadows();

  /// Padding and margin values
  late final Insets insets = Insets(scale);

  /// Text styles
  late final TextStyles text = TextStyles(scale);

  /// Animation Durations
  final Times times = Times();

  /// Shared sizes
  late final Sizes sizes = Sizes();

  late final Gradients gradients = Gradients();
}
