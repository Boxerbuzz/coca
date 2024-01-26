/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';

class CustomAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Widget? leading;
  final Widget? trailing;
  final bool isTransparent;

  @override
  final Size preferredSize;

  const CustomAppBar({
    required this.title,
    super.key,
    this.titleColor,
    this.leading,
    this.trailing,
    this.isTransparent = false,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: isTransparent ? Colors.transparent : context.theme.scaffoldBackgroundColor,
        leading: leading ??
            IconButton(
              onPressed: () => context.pop(),
              icon: Assets.images.icons.arrowLeft.svg(),
              padding: EdgeInsets.zero,
            ),
        title: Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: trailing ?? const SizedBox.shrink(),
          ),
        ],
        elevation: 0,
      );
}
