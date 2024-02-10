/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/toolbar_model.dart';
import 'custom_input_action_item.dart';

MobileToolbarItem inputBlockAction = MobileToolbarItem.withMenu(
  itemIconBuilder: (context, __, ___) => CustomSvg(Assets.images.editor.plus).svg(size: 24),
  itemMenuBuilder: (_, editorState, ___) {
    final selection = editorState.selection;
    if (selection == null) {
      return const SizedBox.shrink();
    }
    return CustomInputBlockBottomSheet(editorState, selection);
  },
);

class CustomInputBlockBottomSheet extends StatefulWidget {
  const CustomInputBlockBottomSheet(this.editorState, this.selection, {super.key});

  final Selection selection;
  final EditorState editorState;

  @override
  State<CustomInputBlockBottomSheet> createState() => _CustomInputBlockBottomSheetState();
}

class _CustomInputBlockBottomSheetState extends State<CustomInputBlockBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final style = MobileToolbarTheme.of(context);

    final children = _options.map((list) {
      // Check if current node is list and its type
      final node = widget.editorState.getNodeAtPath(widget.selection.start.path)!;

      final isSelected =
          node.type == list.id && (list.level == null || node.attributes[HeadingBlockKeys.level] == list.level);

      return CustomInputActionItem(
        title: list.title,
        icon: list.icon,
        color: list.color,
        onPressed: () {
          setState(() {
            widget.editorState.formatNode(
              widget.selection,
              (node) => node.copyWith(
                type: isSelected ? ParagraphBlockKeys.type : list.id,
                attributes: {
                  ParagraphBlockKeys.delta: (node.delta ?? Delta()).toJson(),
                  blockComponentBackgroundColor: node.attributes[blockComponentBackgroundColor],
                  if (!isSelected && list.id == TodoListBlockKeys.type) TodoListBlockKeys.checked: false,
                  if (!isSelected && list.id == HeadingBlockKeys.type) HeadingBlockKeys.level: list.level,
                },
              ),
              selectionExtraInfo: {selectionExtraInfoDoNotAttachTextService: true},
            );
          });
        },
      );
    }).toList();

    style.height(80, animate: true);
    return GridView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: children,
    );
  }
}

List<ToolbarModel> _options = [
  ToolbarModel(
      title: 'H1', icon: Assets.images.editor.h1, id: HeadingBlockKeys.type, level: 1, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'H2', icon: Assets.images.editor.h2, id: HeadingBlockKeys.type, level: 2, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'H3', icon: Assets.images.editor.h3, id: HeadingBlockKeys.type, level: 3, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'Text', icon: Assets.images.editor.paragraph, id: ParagraphBlockKeys.type, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'Checkbox',
      icon: Assets.images.icons.checkSquare,
      id: TodoListBlockKeys.type,
      color: _styles.theme.hPurple),
  ToolbarModel(title: 'Quote', icon: Assets.images.editor.quote, id: QuoteBlockKeys.type, color: _styles.theme.hPurple),
  ToolbarModel(
      title: 'Bulleted',
      icon: Assets.images.editor.bulletedList,
      id: BulletedListBlockKeys.type,
      color: _styles.theme.hYellow),
  ToolbarModel(
      title: 'Numbered',
      icon: Assets.images.editor.numberdList,
      id: NumberedListBlockKeys.type,
      color: _styles.theme.hBlue),
  ToolbarModel(title: 'Image', icon: Assets.images.icons.image, id: ImageBlockKeys.type, color: _styles.theme.hBlue),
  ToolbarModel(
      title: 'Divider', icon: Assets.images.editor.divider, id: DividerBlockKeys.type, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'Table',
      icon: Assets.images.editor.table,
      id: TableBlockKeys.type,
      color: _styles.theme.red.withOpacity(.4)),
  ToolbarModel(
      icon: Assets.images.editor.code,
      title: AppFlowyEditorL10n.current.embedCode,
      id: AppFlowyRichTextKeys.code,
      color: _styles.theme.red.withOpacity(.4)),
];

CustomAppStyles _styles = CustomAppStyles();
