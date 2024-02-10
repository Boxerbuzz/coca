/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../enums/file_extension_enum.dart';
import '../models/asset_model.dart';

final List<AssetModel> attachments = [
  const AssetModel(id: '1', ext: FileExtensionEnum.doc, path: 'Project Brief v1.docx', size: '259.6 KB'),
  const AssetModel(id: '2', ext: FileExtensionEnum.png, path: 'my-landing-page.png', size: '180.4 KB'),
];
