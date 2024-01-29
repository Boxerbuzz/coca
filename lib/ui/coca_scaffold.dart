/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../coca.dart';

class CocaScaffold extends StatelessWidget {
  const CocaScaffold({super.key, required this.child});
  final Widget child;
  static CustomAppStyles get style => _style;
  static CustomAppStyles _style = CustomAppStyles();

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    _style = CustomAppStyles(screenSize: context.sizePx);
    return KeyedSubtree(
      key: ValueKey(_style.scale),
      child: Theme(
        data: _style.theme.theme(),
        child: DefaultTextStyle(
          style: _style.text.p,
          child: ScrollConfiguration(behavior: CustomScrollBehaviour(), child: child),
        ),
      ),
    );
  }
}
