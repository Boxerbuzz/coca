/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../../../../coca.dart';
import 'gallery_model.dart';

final List<MailGalleryModel> gallery = [
  MailGalleryModel(path: '', color: _styles.theme.black.withOpacity(.4), isMini: true, index: 0, main: 1, cross: 3),
  MailGalleryModel(path: '', color: _styles.theme.blue.withOpacity(.4), isMini: true, index: 1, main: 1, cross: 1),
  MailGalleryModel(path: '', color: _styles.theme.amber.withOpacity(.4), isMini: true, index: 2, main: 1, cross: 1),
  MailGalleryModel(path: '', color: _styles.theme.green.withOpacity(.4), isMini: true, index: 3, main: 1, cross: 1),
  MailGalleryModel(path: '', color: _styles.theme.red.withOpacity(.4), isMini: true, index: 4, main: 1, cross: 2),
];

CustomAppStyles _styles = CustomAppStyles();
