/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_back_button.dart';

class CustomAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Widget? leading;
  final Widget? trailing;
  final bool transparent;
  final bool? centerTitle;
  final bool x;

  @override
  final Size preferredSize;

  const CustomAppBar(
      {required this.title,
      super.key,
      this.titleColor,
      this.leading,
      this.trailing,
      this.transparent = false,
      this.centerTitle,
      this.x = false})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: transparent ? Colors.transparent : styles(context).theme.white,
        leading: leading ??
            Padding(
              padding: EdgeInsets.only(left: styles(context).insets.xs, top: styles(context).insets.xs),
              child: x ? CustomBackButton.close() : const CustomBackButton(),
            ),
        title: Text(title, style: styles(context).text.t1.textColor(titleColor ?? styles(context).theme.grey7)),
        centerTitle: centerTitle ?? true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0).add(EdgeInsets.only(right: styles(context).insets.md)),
            child: trailing ?? const SizedBox.shrink(),
          ),
        ],
      );
}
