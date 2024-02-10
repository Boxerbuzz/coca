/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        return _styles.text.t1.bold;
      }
      return _styles.text.t1;
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
        return CustomSvg(checked ? Assets.images.editor.todo : Assets.images.editor.checked).svg(size: 10);
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
    cursorColor: _styles.theme.grey7,
    selectionColor: _styles.theme.hBlue.withOpacity(0.3),
    textStyleConfiguration: TextStyleConfiguration(
      text: _styles.text.t3.textColor(_styles.theme.grey7),
      bold: _styles.text.t3.bold.textColor(_styles.theme.grey7),
      href: _styles.text.t3.italic.underline.textColor(_styles.theme.blue),
      code: _styles.text.p.italic.textColor(_styles.theme.blue),
      italic: _styles.text.p.italic.textColor(_styles.theme.grey7),
      strikethrough: _styles.text.p.lineThrough.textColor(_styles.theme.grey7),
      underline: _styles.text.p.underline.textColor(_styles.theme.grey7),
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

TextStyle baseTextStyle(String fontFamily, {FontWeight? fontWeight}) {
  try {
    return GoogleFonts.getFont(fontFamily, fontWeight: fontWeight);
  } on Exception {
    throw Exception('Font not found');
  }
}

EditorStyle customizeEditorStyle() {
  return EditorStyle(
    padding: PlatformExtension.isDesktopOrWeb
        ? const EdgeInsets.only(left: 100, right: 100, top: 20)
        : const EdgeInsets.symmetric(horizontal: 20),
    cursorColor: Colors.green,
    selectionColor: Colors.green,
    textStyleConfiguration: TextStyleConfiguration(
      text: const TextStyle(
        fontSize: 18.0,
        color: Colors.white54,
      ),
      bold: const TextStyle(
        fontWeight: FontWeight.w900,
      ),
      href: TextStyle(
        color: Colors.amber,
        decoration: TextDecoration.combine(
          [
            TextDecoration.overline,
            TextDecoration.underline,
          ],
        ),
      ),
      code: const TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
        color: Colors.blue,
        backgroundColor: Colors.black12,
      ),
    ),
    textSpanDecorator: (context, node, index, text, textSpan, anotherTextSpan) {
      final attributes = text.attributes;
      final href = attributes?[AppFlowyRichTextKeys.href];
      if (href != null) {
        return TextSpan(
          text: text.text,
          style: textSpan.style,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              debugPrint('onTap: $href');
            },
        );
      }
      return textSpan;
    },
    dragHandleColor: Colors.red,
  );
}

Map<String, BlockComponentBuilder> customBuilder() {
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

  // customize heading block style
  return {
    ...standardBlockComponentBuilderMap,
    HeadingBlockKeys.type: HeadingBlockComponentBuilder(configuration: configuration),
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

CustomAppStyles get _styles => CustomAppStyles();
