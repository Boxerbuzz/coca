/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/widgets/buttons/custom_app_button.dart';
import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomSecondaryButton extends BaseStatelessWidget {
  const CustomSecondaryButton({super.key, required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: CustomAppButton(
        bgColor: styles(context).theme.white,
        onPressed: onTap,
        isSecondary: true,
        child: Center(
          child: Text(label, style: styles(context).text.b1.copyWith(color: styles(context).theme.blue)),
        ),
      ),
    );
  }
}
