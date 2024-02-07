/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

final styleBlockAction = MobileToolbarItem.withMenu(
  itemIconBuilder: (_, __, ___) => CustomSvg(Assets.images.editor.titleCase.path).svg(),
  itemMenuBuilder: (_, editorState, __) {
    if (!onlyShowInSingleSelectionAndTextType(editorState)) {
      return null;
    }
    final selection = editorState.selection;
    if (selection == null) {
      return const SizedBox.shrink();
    }
    return Container();
  },
);
