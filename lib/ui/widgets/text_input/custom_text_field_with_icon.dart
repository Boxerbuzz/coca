/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../coca.dart';

class CustomTextFieldWithIcon extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final String Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  const CustomTextFieldWithIcon({
    this.hintText,
    required this.labelText,
    super.key,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        enabled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        labelText: labelText,
        labelStyle: styles.text.p.textColor(styles.theme.grey4),
      ),
      style: styles.text.b1,
      validator: validator ??
          (val) {
            if (val!.isEmpty) return 'Field can\'t be empty';
            return null;
          },
    );
  }
}
