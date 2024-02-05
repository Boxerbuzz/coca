/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:coca/ui/views/create_task/data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../coca.dart';
import 'components/create_task_header.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  static String route = '/create_task';

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late final EditorScrollController editorScrollController;
  late final editorState = EditorState(document: Document.fromJson(json)); // with an empty paragraph
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

  EditorStyle style() {
    return EditorStyle.mobile(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      cursorColor: styles.theme.grey7,
      selectionColor: styles.theme.hBlue.withOpacity(0.3),
      textStyleConfiguration: TextStyleConfiguration(
        text: TextStyle(fontSize: 18.0, color: styles.theme.grey7),
        bold: TextStyle(color: styles.theme.grey7).bold,
        href: TextStyle(
          color: styles.theme.blue,
          decoration: TextDecoration.combine([TextDecoration.overline, TextDecoration.underline]),
        ),
        code: styles.text.p.italic.textColor(styles.theme.blue),
      ),
      textSpanDecorator: (context, node, index, text, textSpan, textSpan1) {
        final attributes = text.attributes;
        final href = attributes?[AppFlowyRichTextKeys.href];
        if (href != null) {
          return TextSpan(
            text: text.text,
            style: textSpan.style,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('onTap: $href');
              }
              ..onSecondaryTap = () {
                debugPrint('onSecondaryTap: $href');
              }
              ..onTapDown = (details) {
                debugPrint('onTapDown: $href');
              },
          );
        }
        return textSpan;
      },
      dragHandleColor: Colors.black,
    );
  }

  Map<String, BlockComponentBuilder> blocks() {
    final configuration = BlockComponentConfiguration(
      padding: (node) {
        if (HeadingBlockKeys.type == node.type) {
          return const EdgeInsets.symmetric(vertical: 30);
        }
        return const EdgeInsets.symmetric(vertical: 10);
      },
      textStyle: (node) {
        if (HeadingBlockKeys.type == node.type) {
          return const TextStyle(color: Colors.yellow);
        }
        return const TextStyle();
      },
    );
    final map = {
      ...standardBlockComponentBuilderMap,
    };
    // customize the heading block component
    final levelToFontSize = [
      24.0,
      22.0,
      20.0,
      18.0,
      16.0,
      14.0,
    ];
    map[HeadingBlockKeys.type] = HeadingBlockComponentBuilder(
      textStyleBuilder: (level) => GoogleFonts.urbanist(
        fontSize: levelToFontSize.elementAtOrNull(level - 1) ?? 14.0,
        fontWeight: FontWeight.w600,
      ),
    );
    map[ParagraphBlockKeys.type] = ParagraphBlockComponentBuilder(
      configuration: BlockComponentConfiguration(
        placeholderText: (node) => 'Type something...',
      ),
    );
    // customize heading block style
    return {
      ...standardBlockComponentBuilderMap,
      // todo-list block
      TodoListBlockKeys.type: TodoListBlockComponentBuilder(
        configuration: configuration,
        iconBuilder: (context, node) {
          final checked = node.attributes[TodoListBlockKeys.checked] as bool;
          return Icon(
            checked ? Icons.check_box : Icons.check_box_outline_blank,
            size: 20,
            color: Colors.white,
          );
        },
      ),
      // bulleted list block
      BulletedListBlockKeys.type: BulletedListBlockComponentBuilder(
        configuration: configuration,
        iconBuilder: (context, node) {
          return const Icon(
            Icons.circle,
            size: 20,
            color: Colors.green,
          );
        },
      ),
      // quote block
      QuoteBlockKeys.type: QuoteBlockComponentBuilder(
        configuration: configuration,
        iconBuilder: (context, node) {
          return const EditorSvg(
            width: 20,
            height: 20,
            padding: EdgeInsets.only(right: 5.0),
            name: 'quote',
            color: Colors.pink,
          );
        },
      ),
    };
  }

  @override
  void initState() {
    super.initState();
    editorScrollController = EditorScrollController(
      editorState: editorState,
      shrinkWrap: false,
    );
    editor = AppFlowyEditor(
      editorState: editorState,
      characterShortcutEvents: [
        italic,
      ],
      blockComponentBuilders: blocks(),
      editorStyle: style(),
      editorScrollController: editorScrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CreateTaskHeader(),
      body: MobileToolbarV2(
        toolbarHeight: 48.0,
        toolbarItems: [
          textDecorationMobileToolbarItemV2,
          buildTextAndBackgroundColorMobileToolbarItem(),
          blocksMobileToolbarItem,
          linkMobileToolbarItem,
          dividerMobileToolbarItem,
        ],
        editorState: editorState,
        child: Column(
          children: [
            // build appflowy editor
            Expanded(
              child: MobileFloatingToolbar(
                editorState: editorState,
                editorScrollController: editorScrollController,
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
                    onLiveTextInput: null,
                    onLookUp: null,
                    onSearchWeb: null,
                    onShare: null,
                    anchors: TextSelectionToolbarAnchors(
                      primaryAnchor: anchor,
                    ),
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
