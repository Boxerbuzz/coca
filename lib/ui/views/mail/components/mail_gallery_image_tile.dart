/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/gallery_model.dart';

class MailGalleryImageTile extends BaseStatelessWidget {
  const MailGalleryImageTile({super.key, required this.index, this.extent, required this.data});
  final int index;
  final double? extent;
  final MailGalleryModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: extent,
      child: Container(
        decoration: BoxDecoration(color: data.color, borderRadius: styles(context).corners.br12),
        child: CustomSvg(Assets.images.icons.image).svg(color: data.color?.withAlpha(-2)),
      ),
    );
  }
}
