/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../coca.dart';

class CustomTextField extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    required this.hintText,
    super.key,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabled: true,
        hintText: hintText,
      ),
      maxLines: maxLines,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      validator: validator ??
          (val) {
            if (val!.isEmpty) {
              return 'Field can\'t be empty';
            }
            return null;
          },
    );
  }
}
