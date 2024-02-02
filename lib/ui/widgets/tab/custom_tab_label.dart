/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomTabLabel extends StatelessWidget {
  const CustomTabLabel({super.key, required this.label, required this.onPressed, this.isSelected = false});
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: 200.milliseconds,
      style: isSelected ? styles.text.b1.textColor(styles.theme.grey7) : styles.text.p.textColor(styles.theme.grey7),
      child: Expanded(
        child: Center(child: Text(label, maxLines: 1, softWrap: false, overflow: TextOverflow.fade))
            .clickable(onPressed, opaque: true),
      ),
    );
  }
}
