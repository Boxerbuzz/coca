import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_round_button.dart';

class CustomIconButton extends BaseStatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.border,
    this.bgColor,
    this.color,
    this.size = 40,
    this.iconSize,
  });
  static double defaultSize = 28;

  final String icon;
  final VoidCallback onPressed;
  final BorderSide? border;
  final Color? bgColor;
  final Color? color;
  final double? size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    Color defaultColor = styles(context).theme.white;
    Color iconColor = color ?? styles(context).theme.grey7;
    return CustomRoundButton(
      onPressed: onPressed,
      bgColor: bgColor ?? defaultColor,
      border: border,
      size: size,
      child: CustomSvg(icon).svg(height: iconSize ?? defaultSize, width: iconSize ?? defaultSize, color: iconColor),
    );
  }

  Widget safe() => CustomPaddedSafeArea(child: this);
}
