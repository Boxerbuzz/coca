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
  final bool isTransparent;

  @override
  final Size preferredSize;

  const CustomAppBar(
      {required this.title, super.key, this.titleColor, this.leading, this.trailing, this.isTransparent = false})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: isTransparent ? Colors.transparent : styles.theme.white,
        leading: leading ?? Padding(padding: EdgeInsets.only(left: styles.insets.xs), child: const CustomBackButton()),
        title: Text(title, style: styles.text.t1),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: trailing ?? const SizedBox.shrink(),
          ),
        ],
      );
}
