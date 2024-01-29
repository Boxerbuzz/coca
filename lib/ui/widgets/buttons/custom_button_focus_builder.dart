/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class CustomButtonFocusBuilder extends StatefulWidget {
  const CustomButtonFocusBuilder({super.key, required this.builder});
  final Widget Function(BuildContext context, FocusNode focus) builder;

  @override
  State<CustomButtonFocusBuilder> createState() => _CustomButtonFocusBuilderState();
}

class _CustomButtonFocusBuilderState extends State<CustomButtonFocusBuilder> {
  late final _focusNode = FocusNode()..addListener(() => setState(() {}));

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context, _focusNode);
  }
}
