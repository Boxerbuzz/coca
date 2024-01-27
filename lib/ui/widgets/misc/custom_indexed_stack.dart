/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomIndexedStack extends StatefulWidget {
  const CustomIndexedStack({super.key, this.index = 0, this.children = const <Widget>[]});
  final List<Widget> children;
  final int index;

  @override
  State<CustomIndexedStack> createState() => _CustomIndexedStackState();
}

class _CustomIndexedStackState extends State<CustomIndexedStack> {
  double _targetOpacity = 1;

  @override
  void didUpdateWidget(CustomIndexedStack oldWidget) {
    if (oldWidget.index == widget.index) return;
    setState(() => _targetOpacity = 0);
    Future.delayed(1.milliseconds, () => setState(() => _targetOpacity = 1));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: _targetOpacity > 0 ? 250.milliseconds : 0.milliseconds,
      tween: Tween(begin: 0, end: _targetOpacity),
      builder: (_, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: IndexedStack(index: widget.index, children: widget.children),
    );
  }
}
