/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class HomeTaskItem extends StatelessWidget {
  const HomeTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Container(
      width: 266,
      height: 168,
      decoration: BoxDecoration(
        borderRadius: styles.corners.br12,
        color: Colors.white,
        border: Border.all(color: kSilver),
      ),
    );
  }
}
