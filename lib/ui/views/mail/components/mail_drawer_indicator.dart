/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class MailDrawerItemIndicator extends StatefulWidget {
  final double indicatorY;
  final double width;
  final double height;

  const MailDrawerItemIndicator(this.indicatorY, {super.key, this.width = 6, this.height = 24});

  @override
  State<MailDrawerItemIndicator> createState() => _MailDrawerItemIndicatorState();
}

class _MailDrawerItemIndicatorState extends State<MailDrawerItemIndicator> {
  final double _duration = .5;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration.seconds,
      curve: Curves.easeOutBack,
      width: widget.width,
      height: widget.height,
      margin: EdgeInsets.only(top: widget.indicatorY),
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(color: styles.theme.blue, borderRadius: styles.corners.br4),
      ),
    );
  }
}
