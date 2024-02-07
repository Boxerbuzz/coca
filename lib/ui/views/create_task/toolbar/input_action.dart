/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

MobileToolbarItem inputBlockAction() {
  return MobileToolbarItem.withMenu(
    itemIconBuilder: (context, __, ___) => CustomSvg(Assets.images.editor.plus.path).svg(),
    itemMenuBuilder: (_, editorState, ___) {
      final selection = editorState.selection;
      if (selection == null) {
        return const SizedBox.shrink();
      }
      return Container();
    },
  );
}
