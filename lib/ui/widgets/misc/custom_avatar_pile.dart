/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomAvatarPile extends StatefulWidget {
  const CustomAvatarPile({
    super.key,
    required this.urls,
    this.size = 48,
    this.overlapPercent = 0.5,
    this.isLocalImage = false,
    this.showCount = false,
    this.toBeShown,
  });

  final List<String> urls;
  final double size;
  final double overlapPercent;

  final bool isLocalImage;

  final bool showCount;
  final int? toBeShown;

  @override
  State<CustomAvatarPile> createState() => _CustomAvatarPileState();
}

class _CustomAvatarPileState extends State<CustomAvatarPile> with SingleTickerProviderStateMixin {
  final _visibleAvatars = <String>[];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _syncPile();
    });
  }

  @override
  void didUpdateWidget(CustomAvatarPile oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _syncPile();
    });
  }

  void _syncPile() {
    setState(() {
      final newAvatars = widget.urls.where(
        (avatar) => _visibleAvatars.where((visibleAvatar) => visibleAvatar == avatar).isEmpty,
      );

      for (final newAvatar in newAvatars) {
        _visibleAvatars.add(newAvatar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //AppStyle styles = context.styles;
    return LayoutBuilder(
      builder: (context, constraints) {
        final facesCount = widget.toBeShown ?? _visibleAvatars.length;

        double avatarPercentVisible = 1.0 - widget.overlapPercent;

        final maxIntrinsicWidth =
            facesCount > 1 ? (1 + (avatarPercentVisible * (facesCount - 1))) * widget.size : widget.size;

        late double leftOffset;
        if (maxIntrinsicWidth > constraints.maxWidth) {
          leftOffset = 0;
          //(constraints.maxWidth - maxIntrinsicWidth) / 2
          avatarPercentVisible = ((constraints.maxWidth / widget.size) - 1) / (facesCount - 1);
        } else {
          leftOffset = 0;
        }

        if (constraints.maxWidth < widget.size) {
          // There isn't room for a single face. Show nothing.
          return const SizedBox();
        }

        return SizedBox(
          height: widget.size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              for (var i = 0; i < facesCount; i += 1)
                AnimatedPositioned(
                  key: ValueKey(_visibleAvatars[i]),
                  top: 0,
                  height: widget.size,
                  left: leftOffset + (i * avatarPercentVisible * widget.size),
                  width: widget.size,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: CustomAvatar(
                    url: _visibleAvatars[i],
                    isVisible: widget.urls.contains(_visibleAvatars[i]),
                    size: widget.size,
                    onDisappear: () => setState(() => _visibleAvatars.removeAt(i)),
                    isLocalImage: widget.isLocalImage,
                  ),
                ),

              // if (widget.showCount)
              //   Container(
              //     height: widget.size,
              //     width: widget.size,
              //     decoration: const BoxDecoration(shape: BoxShape.circle, color: kGray02),
              //     child: Center(child: Text('+12', style: styles.text.t2)),
              //   ),
            ],
          ),
        );
      },
    );
  }
}
