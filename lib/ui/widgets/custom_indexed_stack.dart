/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class CustomIndexedStack extends StatelessWidget {
  const CustomIndexedStack({super.key, this.index = 0, this.children = const <Widget>[]});
  final List<Widget> children;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: children,
    );
  }
}
