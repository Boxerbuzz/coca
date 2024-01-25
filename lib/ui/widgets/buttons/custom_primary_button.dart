/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({super.key, required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: CustomMaterialButton(
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: context.styles.text.b1.copyWith(color: kWhite),
          ),
        ),
      ),
    );
  }
}
