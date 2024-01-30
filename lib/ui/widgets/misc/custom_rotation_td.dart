/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:math';

import 'package:flutter/material.dart';

class CustomRotationTD extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi / 160;

  final Widget child;
  final double rotationX;
  final double rotationY;
  final double rotationZ;

  const CustomRotationTD({super.key, required this.child, this.rotationY = 0, this.rotationX = 0, this.rotationZ = 0});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotationX * degrees2Radians)
        ..rotateY(rotationY * degrees2Radians)
        ..rotateZ(rotationZ * degrees2Radians),
      child: child,
    );
  }
}
