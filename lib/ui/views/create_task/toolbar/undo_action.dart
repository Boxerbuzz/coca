/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';

final undoAction = MobileToolbarItem.action(
  itemIconBuilder: (_, __, ___) => CustomSvg(Assets.images.editor.undo.path).svg(),
  actionHandler: (BuildContext context, EditorState editorState) => undoCommand.handler(editorState),
);
