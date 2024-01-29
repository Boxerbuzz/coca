/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class CustomButtonEffect extends StatefulWidget {
  const CustomButtonEffect(this.child, {super.key});
  final Widget child;

  @override
  State<CustomButtonEffect> createState() => _CustomButtonEffectState();
}

class _CustomButtonEffectState extends State<CustomButtonEffect> {
  bool _isDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onTapDown: (_) => setState(() => _isDown = true),
      onTapUp: (_) => setState(() => _isDown = false), // not called, TextButton swallows this.
      onTapCancel: () => setState(() => _isDown = false),
      behavior: HitTestBehavior.translucent,
      child: Opacity(opacity: _isDown ? 0.7 : 1, child: ExcludeSemantics(child: widget.child)),
    );
  }
}
