/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import '../custom_padded_safe_area.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.icon, this.onPressed, this.bgColor, this.iconColor});

  final Color? bgColor;
  final Color? iconColor;
  final String? icon;
  final VoidCallback? onPressed;

  CustomBackButton.close({Key? key, VoidCallback? onPressed, Color? bgColor, Color? iconColor})
      : this(key: key, icon: Assets.images.icons.x.path, onPressed: onPressed, bgColor: bgColor, iconColor: iconColor);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: icon ?? Assets.images.icons.arrowLeft.path,
      bgColor: bgColor,
      color: iconColor,
      onPressed: onPressed ?? () => context.pop(),
    );
  }

  Widget safe() => CustomPaddedSafeArea(child: this);
}
