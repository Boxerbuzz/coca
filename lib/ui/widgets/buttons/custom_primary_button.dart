/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_app_button.dart';

class CustomPrimaryButton extends BaseStatelessWidget {
  const CustomPrimaryButton({super.key, required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: CustomAppButton(
        onPressed: onTap,
        child: Center(
          child: Text(label, style: styles(context).text.b1.textColor(styles(context).theme.white)),
        ),
      ),
    );
  }
}
