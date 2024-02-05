/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectItemCellWrapper extends StatelessWidget {
  final Widget? child;
  final int flex;
  final bool isVisible;

  const ProjectItemCellWrapper({super.key, this.child, required this.flex, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    bool? enableAnimations = true;

    if (isVisible == false) return Container();
    int targetFlex = 1 + flex * 100;
    if (enableAnimations == true) {
      return TweenAnimationBuilder<double>(
          curve: !isVisible ? Curves.easeOut : Curves.easeIn,
          tween: Tween<double>(begin: isVisible ? 1 : 0, end: isVisible ? 1 : 0),
          duration: (isVisible ? .5 : .2).seconds,
          builder: (_, value, child) {
            if (value == 0 && !isVisible || child == null) return Container();
            return child.opacity(value).expanded(flex: (targetFlex * value).round());
          },
          child: Container(alignment: Alignment.centerLeft, child: child));
    }

    return Container(alignment: Alignment.centerLeft, child: child).expanded(flex: targetFlex);
  }
}
