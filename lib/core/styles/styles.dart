/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppStyle {
  AppStyle({Size? screenSize}) {
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
  final AppTheme colors = AppTheme();

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
}

@immutable
class TextStyles {
  TextStyles(this._scale);
  final double _scale;

  final urbanist = GoogleFonts.urbanist();

  // headings
  late final TextStyle h1 = _cf(urbanist, sizePx: 36).bold;
  late final TextStyle h2 = _cf(urbanist, sizePx: 32).bold;
  late final TextStyle h3 = _cf(urbanist, sizePx: 24, heightPx: 30).bold;

  // body/ titles
  late final TextStyle t1 = _cf(urbanist, sizePx: 20).bold;
  late final TextStyle t2 = _cf(urbanist, sizePx: 16).bold;
  late final TextStyle t3 = _cf(urbanist, sizePx: 12).regular;

  // paragraph
  late final TextStyle p = _cf(urbanist, sizePx: 14).regular;

  // buttons
  late final TextStyle b1 = _cf(urbanist, sizePx: 14).bold;
  late final TextStyle b2 = _cf(urbanist, sizePx: 12).thick;

  // captions
  late final TextStyle caption = _cf(urbanist, sizePx: 16).regular;

  TextStyle _cf(TextStyle style, {required double sizePx, double? heightPx, double? spacingPc, FontWeight? weight}) {
    sizePx *= _scale;
    if (heightPx != null) {
      heightPx *= _scale;
    }
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing: spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight);
  }
}

@immutable
class Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
  late final double btn = 12;

  late final double check = 3;

  late final br4 = BorderRadius.circular(sm);

  late final br8 = BorderRadius.circular(md);

  late final br16 = BorderRadius.circular(16);

  late final br24 = BorderRadius.circular(24);

  late final br32 = BorderRadius.circular(lg);
}

// TODO: add, @immutable when design is solidified
class Sizes {
  double get maxContentWidth1 => 800;
  double get maxContentWidth2 => 600;
  double get maxContentWidth3 => 500;
  final Size minAppSize = const Size(380, 250);

  double get bottomBarHeight => 118;

  double get icon => 24;

  double get smIcon => 20;
}

@immutable
class Insets {
  Insets(this._scale);
  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 18 * _scale;
  late final double md = 24 * _scale;
  late final double lg = 32 * _scale;
  late final double xl = 48 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;

  late final double btn = 16 * _scale;
}

@immutable
class Shadows {
  final textSoft = [
    Shadow(color: Colors.black.withOpacity(.25), offset: const Offset(0, 2), blurRadius: 4),
  ];
  final text = [
    Shadow(color: Colors.black.withOpacity(.6), offset: const Offset(0, 2), blurRadius: 2),
  ];
  final textStrong = [
    Shadow(color: Colors.black.withOpacity(.6), offset: const Offset(0, 4), blurRadius: 6),
  ];

  final List<BoxShadow> md = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      spreadRadius: 3,
      blurRadius: 20,
      offset: const Offset(0, 7), // changes position of shadow
    ),
  ];

  final List<BoxShadow> sm = [
    const BoxShadow(
      color: Color(0x66000000),
      offset: Offset(4, 8),
      blurRadius: 8,
    )
  ];
}

@immutable
class Gradients {}
