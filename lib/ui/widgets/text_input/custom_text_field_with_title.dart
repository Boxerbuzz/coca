/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../coca.dart';

class CustomTextFieldWithTitle extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFieldWithTitle({
    required this.title,
    required this.hintText,
    super.key,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.titleSmall?.copyWith(color: styles(context).theme.grey4)),
        const SizedBox(height: 10),
        CustomTextField(
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
          maxLines: maxLines,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
