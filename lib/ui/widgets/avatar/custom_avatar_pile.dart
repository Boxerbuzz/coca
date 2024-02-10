/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_avatar_wrapper.dart';

class CustomAvatarPile extends StatefulWidget {
  const CustomAvatarPile({super.key, required this.users, this.size = 48, this.overlap = 0.4, this.faceCountToShow});

  final List<UserModel> users;
  final double size;
  final double overlap;
  final int? faceCountToShow;

  @override
  State<CustomAvatarPile> createState() => _CustomAvatarPileState();
}

class _CustomAvatarPileState extends State<CustomAvatarPile> with SingleTickerProviderStateMixin {
  final _visibleUsers = <UserModel>[];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _sync());
  }

  @override
  void didUpdateWidget(CustomAvatarPile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.users != oldWidget.users) {
      _sync();
    }
  }

  void _sync() {
    if (mounted) {
      setState(() {
        final newUsers =
            widget.users.where((user) => _visibleUsers.where((visibleUser) => visibleUser.image == user.image).isEmpty);

        for (final newUser in newUsers) {
          _visibleUsers.add(newUser);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final facesCount = widget.faceCountToShow ?? _visibleUsers.length;

        double visiblePercent = 1.0 - widget.overlap;

        final intrinsicWidth = facesCount > 1 ? (1 + (visiblePercent * (facesCount - 1))) * widget.size : widget.size;

        late double leftOffset;
        if (intrinsicWidth > constraints.maxWidth) {
          leftOffset = 0;
          visiblePercent = ((constraints.maxWidth / widget.size) - 1) / (facesCount - 1);
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
            clipBehavior: Clip.antiAlias,
            fit: StackFit.passthrough,
            children: [
              for (var i = 0; i < facesCount; i += 1)
                AnimatedPositioned(
                  key: ValueKey(_visibleUsers[i].id),
                  top: 0,
                  height: widget.size,
                  left: leftOffset + (i * visiblePercent * widget.size),
                  width: widget.size,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: CustomAvatarWrapper(
                    user: _visibleUsers[i],
                    showFace: widget.users.contains(_visibleUsers[i]),
                    size: widget.size,
                    onDisappear: () {
                      setState(() {
                        _visibleUsers.removeAt(i);
                      });
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
