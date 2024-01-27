/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomHorizontalScroll extends StatefulWidget {
  final Duration? autoScrollDuration;
  final Curve? autoScrollCurve;
  final Widget child;
  final ScrollPhysics? physics;

  const CustomHorizontalScroll({
    this.autoScrollDuration,
    this.autoScrollCurve,
    required this.child,
    super.key,
    this.physics,
  });

  @override
  State createState() => _CustomHorizontalScrollState();
}

class _CustomHorizontalScrollState extends State<CustomHorizontalScroll> {
  late GlobalKey _childContainerKey;
  late GlobalKey _scrollViewKey;
  double _childWidth = 0.0;
  double _scrollWidth = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _childContainerKey = GlobalKey();
    _scrollViewKey = GlobalKey();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  set childWidth(double width) {
    if (width != _childWidth) {
      _childWidth = width;
      scrollQueryToEnd();
    }
  }

  set scrollWidth(double width) {
    if (width != _scrollWidth) {
      _scrollWidth = width;
      scrollQueryToEnd();
    }
  }

  void scrollQueryToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: widget.autoScrollDuration ?? 500.milliseconds, curve: widget.autoScrollCurve ?? Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Hook into these sub-widgets and rebuild once they callback with their current size
    // AppHelper.getFutureSizeFromGlobalKey(_childContainerKey, (size) => childWidth = size.width);
    // AppHelper.getFutureSizeFromGlobalKey(_scrollViewKey, (size) => scrollWidth = size.width);

    return SingleChildScrollView(
      key: _scrollViewKey,
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      physics: widget.physics ?? const ClampingScrollPhysics(),
      child: Container(key: _childContainerKey, child: widget.child),
    );
  }
}
