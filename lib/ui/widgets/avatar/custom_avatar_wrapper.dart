/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomAvatarWrapper extends StatefulWidget {
  const CustomAvatarWrapper({
    super.key,
    required this.user,
    required this.size,
    required this.showFace,
    required this.onDisappear,
  });

  final UserModel user;
  final double size;
  final bool showFace;
  final VoidCallback onDisappear;

  @override
  State<CustomAvatarWrapper> createState() => _CustomAvatarWrapperState();
}

class _CustomAvatarWrapperState extends State<CustomAvatarWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          widget.onDisappear();
        }
      });
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _syncScaleAnimationWithWidget();
  }

  @override
  void didUpdateWidget(CustomAvatarWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    _syncScaleAnimationWithWidget();
  }

  void _syncScaleAnimationWithWidget() {
    if (widget.showFace && !_scaleController.isCompleted && _scaleController.status != AnimationStatus.forward) {
      _scaleController.forward();
    } else if (!widget.showFace &&
        !_scaleController.isDismissed &&
        _scaleController.status != AnimationStatus.reverse) {
      _scaleController.reverse();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: CustomAvatar(
              user: widget.user,
              size: widget.size,
              color: styles.theme.grey8,
              bg: styles.theme.grey3,
            ),
          );
        },
      ),
    );
  }
}
