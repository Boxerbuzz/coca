/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar(
      {super.key,
      required this.url,
      required this.size,
      required this.isVisible,
      required this.onDisappear,
      this.isLocalImage = false});

  final String url;
  final double size;
  final bool isVisible;
  final VoidCallback onDisappear;
  final bool isLocalImage;

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(CustomAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);

    _syncScaleAnimationWithWidget();
  }

  void _syncScaleAnimationWithWidget() {
    if (widget.isVisible && !_scaleController.isCompleted && _scaleController.status != AnimationStatus.forward) {
      _scaleController.forward();
    } else if (!widget.isVisible &&
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
      child: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                  image: DecorationImage(
                    image: widget.isLocalImage ? AssetImage(widget.url) : NetworkImage(widget.url) as ImageProvider,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
