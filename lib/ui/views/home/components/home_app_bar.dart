/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HomeAppBar extends BaseStatelessWidget {
  final AnimationController controller;
  final Animation<double> animation;
  final double opacity;
  const HomeAppBar({super.key, required this.animation, required this.controller, required this.opacity});

  @override
  Widget build(BuildContext context) {
    final double barHeight = AppBar().preferredSize.height + (Platform.isAndroid ? 30 : 50);
    final double statusBar = context.mq.padding.top;

    UserModel user = context.watch<MainProvider>().user ?? const UserModel();

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 40 * (1.0 - animation.value), 0.0),
            child: Container(
              height: barHeight,
              padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md).add(EdgeInsets.only(top: statusBar)),
              decoration: BoxDecoration(
                boxShadow: opacity > 0 ? styles(context).shadows.custom(styles(context).theme.shadow, .07) : null,
                color: styles(context).theme.white.withOpacity(opacity),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomSvg(Assets.images.logo.coca).svg(height: 24, width: 24),
                  const Spacer(),
                  IconButton(
                      icon: CustomSvg(Assets.images.icons.bell).svg(height: 24, width: 24),
                      onPressed: () => context.push(NotificationScreen.route)),
                  CustomAvatar(user: user, size: 35, bg: styles(context).theme.grey3),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
