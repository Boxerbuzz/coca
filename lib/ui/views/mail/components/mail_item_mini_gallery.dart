/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/gallery_data.dart';
import 'mail_gallery_image_tile.dart';

class MailItemMiniGallery extends StatelessWidget {
  const MailItemMiniGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        ...gallery.map(
          (e) => StaggeredGridTile.count(
            crossAxisCellCount: e.cross,
            mainAxisCellCount: e.main,
            child: MailGalleryImageTile(index: e.index, data: e),
          ),
        )
      ],
    );
  }
}
