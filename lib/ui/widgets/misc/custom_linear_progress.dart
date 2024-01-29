/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomLinearProgress extends StatelessWidget {
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
          decoration: BoxDecoration(
            color: styles.theme.silver,
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
                decoration: BoxDecoration(color: styles.theme.green, borderRadius: BorderRadius.circular(5)),
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
