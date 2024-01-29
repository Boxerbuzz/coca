/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeAppBar extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> animation;
  final double opacity;
  const HomeAppBar({super.key, required this.animation, required this.controller, required this.opacity});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height + 50;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 40 * (1.0 - animation.value), 0.0),
            child: Container(
              height: appBarHeight,
              padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
              decoration: BoxDecoration(boxShadow: styles.shadows.sm, color: styles.theme.white.withOpacity(opacity)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Assets.images.logo.coca.svg(height: 24, width: 24),
                  const Spacer(),
                  IconButton(icon: Assets.images.icons.bell.svg(), onPressed: () => context.pop()),
                  CustomAvatar(path: Assets.images.avatar.user.path, size: 35, isLocal: true, bg: styles.theme.grey3),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
