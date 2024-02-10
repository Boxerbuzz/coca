/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';

final redoAction = MobileToolbarItem.action(
  itemIconBuilder: (_, __, ___) => CustomSvg(Assets.images.editor.redo).svg(size: 24),
  actionHandler: (BuildContext context, EditorState editorState) => redoCommand.handler(editorState),
);
