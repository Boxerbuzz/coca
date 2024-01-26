/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/services.dart';
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/agenda.svg
  SvgGenImage get agenda => const SvgGenImage('assets/images/icons/agenda.svg');

  /// File path: assets/images/icons/arrow-left.svg
  SvgGenImage get arrowLeft => const SvgGenImage('assets/images/icons/arrow-left.svg');

  /// File path: assets/images/icons/check.svg
  SvgGenImage get check => const SvgGenImage('assets/images/icons/check.svg');

  /// File path: assets/images/icons/eye-off.svg
  SvgGenImage get eyeOff => const SvgGenImage('assets/images/icons/eye-off.svg');

  /// File path: assets/images/icons/google-logo.svg
  SvgGenImage get googleLogo => const SvgGenImage('assets/images/icons/google-logo.svg');

  /// File path: assets/images/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/images/icons/home.svg');

  /// File path: assets/images/icons/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/images/icons/lock.svg');

  /// File path: assets/images/icons/mail.svg
  SvgGenImage get mail => const SvgGenImage('assets/images/icons/mail.svg');

  /// File path: assets/images/icons/message.svg
  SvgGenImage get message => const SvgGenImage('assets/images/icons/message.svg');

  /// File path: assets/images/icons/person.svg
  SvgGenImage get person => const SvgGenImage('assets/images/icons/person.svg');

  /// File path: assets/images/icons/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/images/icons/phone.svg');

  /// File path: assets/images/icons/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/images/icons/plus.svg');

  /// File path: assets/images/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/icons/search.svg');

  /// File path: assets/images/icons/user.svg
  SvgGenImage get user => const SvgGenImage('assets/images/icons/user.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [agenda, arrowLeft, check, eyeOff, googleLogo, home, lock, mail, message, person, phone, plus, search, user];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width = 18,
    double? height = 18,
    BoxFit fit = BoxFit.scaleDown,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
