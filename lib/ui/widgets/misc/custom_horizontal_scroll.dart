/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class CustomHorizontalScroll extends StatefulWidget {
  final Duration? duration;
  final Curve? curve;
  final Widget child;
  final ScrollPhysics? physics;

  const CustomHorizontalScroll({this.duration, this.curve, required this.child, super.key, this.physics});

  @override
  State createState() => _CustomHorizontalScrollState();
}

class _CustomHorizontalScrollState extends State<CustomHorizontalScroll> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _controller,
      physics: widget.physics ?? const ClampingScrollPhysics(),
      child: Container(child: widget.child),
    );
  }
}
