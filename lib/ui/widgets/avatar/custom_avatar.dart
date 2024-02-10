/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../coca.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar({super.key, this.user, this.size = 48, this.color, this.bg, this.isLocal = false, this.path});

  final UserModel? user;
  final double size;
  final Color? color;
  final Color? bg;
  final bool isLocal;

  final String? path;

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends BaseStatefulWidget<CustomAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.bg, boxShadow: styles.shadows.sm),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.user?.firstName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: styles.text.caption,
                ),
              ),
            ),
            if (widget.isLocal && widget.path != null) Image.asset(widget.path!),
            if (!widget.isLocal) ...{
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.user?.image ?? '',
                  fadeInDuration: const Duration(milliseconds: 250),
                  fit: BoxFit.contain),
            },
          ],
        ),
      ),
    );
  }
}
