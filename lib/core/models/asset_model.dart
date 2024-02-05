/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import '../../coca.dart';

class AssetModel extends Equatable {
  const AssetModel({this.id = '', this.ext = FileExtensionEnum.doc, this.path = '', this.size = ''});

  final String id;
  final FileExtensionEnum ext;
  final String path;
  final String size;

  @override
  List<Object?> get props => [id, ext, path];
}
