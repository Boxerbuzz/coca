/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

/// A static class containing constants and functions for the standardized theming.
class AppTheme {
  /// Create an instance of [ThemeData] that can be passed to a [MaterialApp].

  final Color blue = primary;
  final Color cyan = const Color(0xff59C3FF);
  final Color red = const Color(0xffF05A5A);
  final Color green = const Color(0xff48BD69);
  final Color yellow = const Color(0xffFABE25);
  final Color amber = const Color(0xffffa640);
  final Color black = const Color(0xff000000);
  final Color gray = grey;
  final Color white = const Color(0xffffffff);
  final Color silver = const Color(0xffE6E9ED);

  //highlights
  final Color hYellow = const Color(0xffFFD88D);
  final Color hBlue = const Color(0xffB1E5FC);
  final Color hPurple = const Color(0xffCABDFF);
  final Color hGreen = const Color(0xffA3E4B7);
  //greyscale
  final Color grey8 = const Color(0xff1D1E25);
  final Color grey7 = const Color(0xff242B42);
  final Color grey6 = const Color(0xff2B3453);
  final Color grey5 = const Color(0xff808D9E);
  final Color grey4 = const Color(0xff7E8CA0);
  final Color shadow = const Color(0xff9EA0A9);

  final Color ash = const Color(0xffF6F7FA);

  final Color grey3 = const Color(0xffE9ECF2);
  final Color grey2 = const Color(0xffF8F8FB);
  final Color grey1 = const Color(0xffEDF2F7);
  final Color grey0 = const Color(0xffF8FAFC);

  final bool isDark = false;

  ThemeData theme() {
    TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    /// color scheme
    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: blue,
        secondary: secondary,
        primaryContainer: blue,
        secondaryContainer: secondary,
        onPrimary: white,
        onSecondary: white,
        onError: white,
        onSurface: white,
        onErrorContainer: white,
        error: red,
        surface: white);

    /// input border definition
    InputBorder inputBorder = UnderlineInputBorder(borderSide: BorderSide(width: 1.0, color: grey3));

    /// theme definition
    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme, useMaterial3: true).copyWith(
        textSelectionTheme: TextSelectionThemeData(cursorColor: blue),
        highlightColor: grey1,
        inputDecorationTheme: InputDecorationTheme(
          outlineBorder: const BorderSide(width: 1.0),
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder.copyWith(borderSide: BorderSide(color: blue)),
          errorBorder: inputBorder.copyWith(borderSide: BorderSide(color: red)),
          focusedErrorBorder: inputBorder.copyWith(borderSide: BorderSide(color: red)),
          fillColor: colorScheme.surface,
          hoverColor: colorScheme.surface,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ));

    return t;
  }
}
