/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomEmptyPlaceHolder extends StatelessWidget {
  const CustomEmptyPlaceHolder(
      {super.key, required this.title, required this.subtitle, required this.assets, this.size});
  final String assets;
  final String title;
  final String subtitle;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgGenImage(assets).svg(width: size?.width ?? 119, height: size?.height ?? 112),
          Gap(styles.insets.md),
          Text(title, style: styles.text.t1, textAlign: TextAlign.center),
          Gap(styles.insets.xs),
          Text(
            subtitle,
            style: styles.text.t2.textColor(styles.theme.grey4).regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
