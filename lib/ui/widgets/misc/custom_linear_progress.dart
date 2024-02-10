/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomLinearProgress extends BaseStatelessWidget {
  const CustomLinearProgress({super.key, this.percentage = 0, this.width});
  final double percentage;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 5,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: styles(context).theme.silver,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: percent),
          duration: 10.milliseconds,
          builder: (context, value, child) {
            return FractionallySizedBox(
              widthFactor: value,
              child: Container(
                height: 5,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: styles(context).theme.green, borderRadius: BorderRadius.circular(5)),
              ),
            );
          },
        ),
      ],
    );
  }

  double get percent {
    double value = (percentage / 100);
    var res = value * 1;
    return res;
  }
}
