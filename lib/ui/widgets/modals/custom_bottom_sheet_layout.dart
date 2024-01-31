/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomBottomSheetLayout extends StatelessWidget {
  const CustomBottomSheetLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(12),
            Center(
              child: Container(
                  height: 6,
                  width: 48,
                  decoration: BoxDecoration(borderRadius: styles.corners.br8, color: styles.theme.silver)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
