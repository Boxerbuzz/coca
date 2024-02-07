/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';

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
        return styles.text.t1.bold;
      }
      return styles.text.t1;
    },
    placeholderText: (node) {
      if (HeadingBlockKeys.type == node.type) {
        return 'Type a heading...';
      }
      return 'Type something...';
    },
  );
  return {
    ...standardBlockComponentBuilderMap,
    TodoListBlockKeys.type: TodoListBlockComponentBuilder(
      configuration: configuration,
      iconBuilder: (context, node) {
        final checked = node.attributes[TodoListBlockKeys.checked] as bool;
        return CustomSvg(checked ? Assets.images.editor.todo.path : Assets.images.editor.checked.path).svg(size: 10);
      },
    ),
    BulletedListBlockKeys.type: BulletedListBlockComponentBuilder(
      configuration: configuration,
      iconBuilder: (context, node) {
        return const Icon(Icons.circle, size: 20, color: Colors.green);
      },
    ),
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
    PageBlockKeys.type: PageBlockComponentBuilder(),
    DividerBlockKeys.type: DividerBlockComponentBuilder(configuration: configuration),
    ParagraphBlockKeys.type: ParagraphBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (_) => PlatformExtension.isDesktopOrWeb ? AppFlowyEditorL10n.current.slashPlaceHolder : ' ',
      ),
    ),
    NumberedListBlockKeys.type: NumberedListBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (_) => AppFlowyEditorL10n.current.listItemPlaceholder,
      ),
    ),
    HeadingBlockKeys.type: HeadingBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (node) => 'Heading ${node.attributes[HeadingBlockKeys.level]}',
      ),
    ),
    ImageBlockKeys.type: ImageBlockComponentBuilder(showMenu: true),
    TableBlockKeys.type: TableBlockComponentBuilder(),
    TableCellBlockKeys.type: TableCellBlockComponentBuilder(),
  };
}

EditorStyle style() {
  return EditorStyle.mobile(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    cursorColor: styles.theme.grey7,
    selectionColor: styles.theme.hBlue.withOpacity(0.3),
    textStyleConfiguration: TextStyleConfiguration(
      text: styles.text.t3.textColor(styles.theme.grey7),
      bold: styles.text.t3.bold.textColor(styles.theme.grey7),
      href: styles.text.t3.italic.underline.textColor(styles.theme.blue),
      code: styles.text.p.italic.textColor(styles.theme.blue),
      italic: styles.text.p.italic.textColor(styles.theme.grey7),
      strikethrough: styles.text.p.lineThrough.textColor(styles.theme.grey7),
      underline: styles.text.p.underline.textColor(styles.theme.grey7),
    ),
    textSpanDecorator: (_, node, index, text, textSpan, textSpan1) {
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
