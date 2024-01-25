/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A static class containing constants and functions for the standardized theming.
class AppTheme {
  /// Create an instance of [ThemeData] that can be passed to a [MaterialApp].
  static ThemeData light() {
    const colorScheme = ColorScheme.light(primary: kBlue);

    const inputBorder = UnderlineInputBorder(borderSide: BorderSide(width: 1.0, color: kGray03));

    return ThemeData(
      fontFamily: GoogleFonts.urbanist().fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: kWhite,
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        outlineBorder: const BorderSide(width: 1.0),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(borderSide: const BorderSide(color: kBlue)),
        errorBorder: inputBorder.copyWith(borderSide: const BorderSide(color: kRed)),
        focusedErrorBorder: inputBorder.copyWith(borderSide: const BorderSide(color: kRed)),
        fillColor: colorScheme.background,
        hoverColor: colorScheme.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
