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
  @override
  Widget build(BuildContext context) {
    //final style = MobileToolbarTheme.of(context);

    return Column(
      children: [
        _TextBlockSelector(
          key: const ValueKey('text_block_selector'),
          editorState: widget.editorState,
          selection: widget.selection,
        ),
      ],
    );
  }
}

//// upper block
class _TextBlockSelector extends StatefulWidget {
  const _TextBlockSelector({super.key, required this.editorState, required this.selection});

  final EditorState editorState;
  final Selection selection;

  @override
  State<_TextBlockSelector> createState() => _TextBlockSelectorState();
}

class _TextBlockSelectorState extends BaseStatefulWidget<_TextBlockSelector> {
  bool isSelected(ToolbarModel style) {
    final selection = widget.selection;
    final nodes = widget.editorState.getNodesInSelection(selection);
    final bool isSelected;

    if (selection.isCollapsed) {
      isSelected = widget.editorState.toggledStyle.containsKey(style.title);
    } else {
      isSelected = nodes.allSatisfyInSelection(selection, (delta) {
        return delta.everyAttributes((attributes) => attributes[style.title] == true);
      });
    }

    return isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _styles.insets.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ..._textBlock.map(
                (e) => SizedBox(
                  height: 60,
                  child: CustomAppButton(
                    bgColor: isSelected(e) ? _styles.theme.blue : Colors.transparent,
                    onPressed: () => onPressed(e),
                    padding: EdgeInsets.symmetric(vertical: _styles.insets.xs, horizontal: _styles.insets.md),
                    expand: true,
                    child: CustomSvg(e.icon).svg(
                      size: 30,
                      color: isSelected(e) ? _styles.theme.white : _styles.theme.grey7,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(_styles.insets.md),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 60,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: _styles.corners.br12),
                margin: EdgeInsets.symmetric(horizontal: _styles.insets.sm),
                child: Row(
                  children: [
                    ..._two.map((e) {
                      if (_two.indexOf(e).isOdd) {
                        return VerticalDivider(color: _styles.theme.grey6, width: 1, thickness: 1);
                      }
                      return Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(color: isSelected(e) ? _styles.theme.blue : _styles.theme.grey3),
                          child: Center(
                            child: CustomSvg(e.icon).svg(
                              size: 24,
                              color: isSelected(e) ? _styles.theme.white : _styles.theme.grey7,
                            ),
                          ),
                        ).clickable(() => onPressed(e)),
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
                decoration: BoxDecoration(color: _styles.theme.grey3, borderRadius: _styles.corners.br12),
                child: Center(child: CustomSvg(Assets.images.editor.palette).svg(size: 24, color: _styles.theme.grey7)),
              ).clickable(() {}),
            ),
            Gap(_styles.insets.sm),
          ],
        ),
        Gap(_styles.insets.md),
        Container(
          height: 60,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: _styles.corners.br12),
          margin: EdgeInsets.symmetric(horizontal: _styles.insets.sm),
          child: Row(
            children: [
              ..._three.map(
                (e) {
                  if (_three.indexOf(e).isOdd) {
                    return VerticalDivider(color: _styles.theme.grey6, width: 1, thickness: 1);
                  }
                  return Expanded(
                    child: Container(
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(color: isSelected(e) ? _styles.theme.blue : _styles.theme.grey3),
                      child: Center(
                        child: CustomSvg(e.icon).svg(
                          size: 24,
                          color: isSelected(e) ? _styles.theme.white : _styles.theme.grey7,
                        ),
                      ),
                    ).clickable(() => onPressed(e)),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onPressed(ToolbarModel style) {
    setState(() {
      widget.editorState.toggleAttribute(
        style.title,
        selectionExtraInfo: {selectionExtraInfoDoNotAttachTextService: true},
      );
    });
  }
}

//// data
List<ToolbarModel> _textBlock = [
  ToolbarModel(
      title: 'H1', icon: Assets.images.editor.h1, id: HeadingBlockKeys.type, level: 1, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'H2', icon: Assets.images.editor.h2, id: HeadingBlockKeys.type, level: 2, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'H3', icon: Assets.images.editor.h3, id: HeadingBlockKeys.type, level: 3, color: _styles.theme.hGreen),
  ToolbarModel(
      title: 'Text', icon: Assets.images.editor.paragraph, id: ParagraphBlockKeys.type, color: _styles.theme.hGreen),
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
  ToolbarModel(title: 'Quote', icon: Assets.images.editor.quote, id: QuoteBlockKeys.type, color: _styles.theme.hPurple),
  const ToolbarModel(),
  ToolbarModel(
      title: 'Bulleted',
      icon: Assets.images.editor.bulletedList,
      id: BulletedListBlockKeys.type,
      color: _styles.theme.hYellow),
  const ToolbarModel(),
  ToolbarModel(
      title: 'Numbered',
      icon: Assets.images.editor.numberdList,
      id: NumberedListBlockKeys.type,
      color: _styles.theme.hBlue),
  const ToolbarModel(),
  ToolbarModel(
    title: 'Link',
    icon: Assets.images.editor.link,
    id: 'link',
    color: _styles.theme.hPurple,
  ),
];

CustomAppStyles _styles = CustomAppStyles();
