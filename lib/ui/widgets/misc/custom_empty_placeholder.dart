/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomEmptyPlaceHolder extends BaseStatelessWidget {
  const CustomEmptyPlaceHolder(
      {super.key, required this.title, required this.subtitle, required this.assets, this.size, this.height});
  final String assets;
  final String title;
  final String subtitle;
  final Size? size;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSvg(assets).svg(width: size?.width ?? 119, height: size?.height ?? 112),
          Gap(styles(context).insets.md),
          Text(title, style: styles(context).text.t1, textAlign: TextAlign.center),
          Gap(styles(context).insets.xs),
          Text(
            subtitle,
            style: styles(context).text.t2.textColor(styles(context).theme.grey4).regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
