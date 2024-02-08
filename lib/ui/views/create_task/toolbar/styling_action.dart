/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:coca/ui/widgets/buttons/custom_app_button.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/toolbar_model.dart';

final styleBlockAction = MobileToolbarItem.withMenu(
  itemIconBuilder: (_, __, ___) => CustomSvg(Assets.images.editor.titleCase).svg(size: 24),
  itemMenuBuilder: (_, editorState, __) {
    if (!onlyShowInSingleSelectionAndTextType(editorState)) {
      return null;
    }
    final selection = editorState.selection;
    if (selection == null) {
      return const SizedBox.shrink();
    }
    return CustomStyleBlockBottomSheet(editorState, selection);
  },
);

//// Custom Modification pop up
class CustomStyleBlockBottomSheet extends StatefulWidget {
  const CustomStyleBlockBottomSheet(this.editorState, this.selection, {super.key});

  final EditorState editorState;
  final Selection selection;

  @override
  State<CustomStyleBlockBottomSheet> createState() => _CustomStyleBlockBottomSheetState();
}

class _CustomStyleBlockBottomSheetState extends State<CustomStyleBlockBottomSheet> {
  final textDecorations = [];

  @override
  Widget build(BuildContext context) {
    final style = MobileToolbarTheme.of(context);

    final bius = textDecorations.map((currentDecoration) {
      // Check current decoration is active or not
      final selection = widget.selection;
      final nodes = widget.editorState.getNodesInSelection(selection);
      final bool isSelected;
      if (selection.isCollapsed) {
        isSelected = widget.editorState.toggledStyle.containsKey(
          currentDecoration.name,
        );
      } else {
        isSelected = nodes.allSatisfyInSelection(selection, (delta) {
          return delta.everyAttributes(
            (attributes) => attributes[currentDecoration.name] == true,
          );
        });
      }

      return MobileToolbarItemMenuBtn(
        icon: AFMobileIcon(
          afMobileIcons: currentDecoration.icon,
          color: MobileToolbarTheme.of(context).iconColor,
        ),
        label: Text(currentDecoration.label),
        isSelected: isSelected,
        onPressed: () {
          setState(() {
            widget.editorState.toggleAttribute(
              currentDecoration.name,
              selectionExtraInfo: {
                selectionExtraInfoDoNotAttachTextService: true,
              },
            );
          });
        },
      );
    }).toList();

    return const Column(
      children: [
        _TextBlockSelector(true, key: ValueKey('text_block_selector')),
      ],
    );
  }
}

//// upper block
class _TextBlockSelector extends StatefulWidget {
  const _TextBlockSelector(this.isActive, {super.key});
  final bool isActive;

  @override
  State<_TextBlockSelector> createState() => _TextBlockSelectorState();
}

class _TextBlockSelectorState extends State<_TextBlockSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: styles.insets.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ..._textBlock.map(
                (e) => SizedBox(
                  height: 60,
                  child: CustomAppButton(
                    bgColor: widget.isActive ? styles.theme.blue : Colors.transparent,
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(vertical: styles.insets.xs, horizontal: styles.insets.md),
                    expand: true,
                    child: CustomSvg(e.icon)
                        .svg(size: 30, color: widget.isActive ? styles.theme.white : styles.theme.grey7),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(styles.insets.md),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 60,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: styles.corners.br12),
                margin: EdgeInsets.symmetric(horizontal: styles.insets.sm),
                child: Row(
                  children: [
                    ..._two.map((e) {
                      if (_two.indexOf(e).isOdd) {
                        return VerticalDivider(color: styles.theme.grey6, width: 1, thickness: 1);
                      }
                      return Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(color: styles.theme.grey3),
                          child: Center(child: CustomSvg(e.icon).svg(size: 24, color: styles.theme.grey7)),
                        ).clickable(() {}),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 60,
                decoration: BoxDecoration(color: styles.theme.grey3, borderRadius: styles.corners.br12),
                child: Center(child: CustomSvg(Assets.images.editor.palette).svg(size: 24, color: styles.theme.grey7)),
              ).clickable(() {}),
            ),
            Gap(styles.insets.sm),
          ],
        ),
        Gap(styles.insets.md),
        Container(
          height: 60,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: styles.corners.br12),
          margin: EdgeInsets.symmetric(horizontal: styles.insets.sm),
          child: Row(
            children: [
              ..._three.map(
                (e) {
                  if (_three.indexOf(e).isOdd) {
                    return VerticalDivider(color: styles.theme.grey6, width: 1, thickness: 1);
                  }
                  return Expanded(
                    child: Container(
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(color: styles.theme.grey3),
                      child: Center(child: CustomSvg(e.icon).svg(size: 24, color: styles.theme.grey7)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//// data
List<ToolbarModel> _textBlock = [
  ToolbarModel(
      title: 'H1', icon: Assets.images.editor.h1, id: HeadingBlockKeys.type, level: 1, color: styles.theme.hGreen),
  ToolbarModel(
      title: 'H2', icon: Assets.images.editor.h2, id: HeadingBlockKeys.type, level: 2, color: styles.theme.hGreen),
  ToolbarModel(
      title: 'H3', icon: Assets.images.editor.h3, id: HeadingBlockKeys.type, level: 3, color: styles.theme.hGreen),
  ToolbarModel(
      title: 'Text', icon: Assets.images.editor.paragraph, id: ParagraphBlockKeys.type, color: styles.theme.hGreen),
];

List<ToolbarModel> _two = [
  ToolbarModel(icon: Assets.images.editor.bold, title: AppFlowyEditorL10n.current.bold, id: AppFlowyRichTextKeys.bold),
  const ToolbarModel(),
  ToolbarModel(
      icon: Assets.images.editor.italic, title: AppFlowyEditorL10n.current.italic, id: AppFlowyRichTextKeys.italic),
  const ToolbarModel(),
  ToolbarModel(
      icon: Assets.images.editor.underline,
      title: AppFlowyEditorL10n.current.underline,
      id: AppFlowyRichTextKeys.underline),
  const ToolbarModel(),
  ToolbarModel(
      icon: Assets.images.editor.strikethrough,
      title: AppFlowyEditorL10n.current.strikethrough,
      id: AppFlowyRichTextKeys.strikethrough),
];

List<ToolbarModel> _three = [
  ToolbarModel(title: 'Quote', icon: Assets.images.editor.quote, id: QuoteBlockKeys.type, color: styles.theme.hPurple),
  const ToolbarModel(),
  ToolbarModel(
      title: 'Bulleted',
      icon: Assets.images.editor.bulletedList,
      id: BulletedListBlockKeys.type,
      color: styles.theme.hYellow),
  const ToolbarModel(),
  ToolbarModel(
      title: 'Numbered',
      icon: Assets.images.editor.numberdList,
      id: NumberedListBlockKeys.type,
      color: styles.theme.hBlue),
  const ToolbarModel(),
  ToolbarModel(
    title: 'Link',
    icon: Assets.images.editor.link,
    id: 'link',
    color: styles.theme.hPurple,
  ),
];
