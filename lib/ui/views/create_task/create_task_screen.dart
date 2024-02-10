/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:coca/ui/views/create_task/misc/data.dart';
import 'package:coca/ui/views/create_task/toolbar/bold_action.dart';
import 'package:coca/ui/views/create_task/toolbar/input_action.dart';
import 'package:coca/ui/views/create_task/toolbar/redo_action.dart';
import 'package:coca/ui/views/create_task/toolbar/undo_action.dart';
import 'package:flutter/material.dart';

import 'components/create_task_header.dart';
import 'misc/editor_config.dart';
import 'toolbar/styling_action.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  static String route = '/create_task';

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late final EditorScrollController _scrollController;
  late final editorState = EditorState.blank(); // with an empty paragraph
  late final AppFlowyEditor editor;

  CharacterShortcutEvent italic = CharacterShortcutEvent(
    key: 'Underscore to italic',
    character: '_',
    handler: (editorState) async => handleFormatByWrappingWithSingleCharacter(
      editorState: editorState,
      character: '_',
      formatStyle: FormatStyleByWrappingWithSingleChar.italic,
    ),
  );

  final json = Map<String, Object>.from(jsonDecode(document));

  @override
  void initState() {
    super.initState();
    _scrollController = EditorScrollController(
      editorState: editorState,
      shrinkWrap: false,
    );
    editor = AppFlowyEditor(
      editorState: editorState,
      characterShortcutEvents: [italic],
      blockComponentBuilders: blocks(),
      editorStyle: style(),
      editorScrollController: _scrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CreateTaskHeader(),
      body: MobileToolbarV2(
        toolbarHeight: 60.0,
        buttonHeight: 40,
        toolbarItems: [redoAction, undoAction, styleBlockAction, inputBlockAction, boldAction],
        editorState: editorState,
        child: Column(
          children: [
            Expanded(
              child: MobileFloatingToolbar(
                editorState: editorState,
                editorScrollController: _scrollController,
                toolbarBuilder: (context, anchor, closeToolbar) {
                  return AdaptiveTextSelectionToolbar.editable(
                    clipboardStatus: ClipboardStatus.pasteable,
                    onCopy: () {
                      copyCommand.execute(editorState);
                      closeToolbar();
                    },
                    onCut: () => cutCommand.execute(editorState),
                    onPaste: () => pasteCommand.execute(editorState),
                    onSelectAll: () => selectAllCommand.execute(editorState),
                    onLiveTextInput: () {},
                    onLookUp: () {},
                    onSearchWeb: () {},
                    onShare: () {},
                    anchors: TextSelectionToolbarAnchors(primaryAnchor: anchor),
                  );
                },
                child: editor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
