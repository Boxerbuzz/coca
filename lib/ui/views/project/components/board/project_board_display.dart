/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

import '../../../../../coca.dart';
import 'project_board_card.dart';
import 'project_board_footer.dart';
import 'project_board_header.dart';

class ProjectBoardDisplay extends StatefulWidget {
  const ProjectBoardDisplay({super.key});

  @override
  State<ProjectBoardDisplay> createState() => _ProjectBoardDisplayState();
}

class _ProjectBoardDisplayState extends BaseStatefulWidget<ProjectBoardDisplay> {
  final AppFlowyBoardController _controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {},
    onMoveGroupItem: (groupId, fromIndex, toIndex) {},
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {},
  );

  final ScrollController _scrollController = ScrollController();

  late AppFlowyBoardScrollController _boardController;

  @override
  void initState() {
    _boardController = AppFlowyBoardScrollController();

    _controller.addGroup(todo);
    _controller.addGroup(backlog);
    _controller.addGroup(progress);
    _controller.addGroup(completed);
    _controller.addGroup(canceled);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = AppFlowyBoardConfig(
      groupBackgroundColor: HexColor.fromHex('#F8F8FB'),
      stretchGroupHeight: false,
      boardCornerRadius: 23,
      groupBodyPadding: EdgeInsets.all(styles.insets.xxs),
      groupMargin: EdgeInsets.symmetric(horizontal: styles.insets.xxs),
      groupCornerRadius: 23,
      boardMargin: EdgeInsets.symmetric(horizontal: styles.insets.md),
      showScrollBars: false,
    );

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: AppFlowyBoard(
        boardScrollController: _boardController,
        scrollController: _scrollController,
        controller: _controller,
        cardBuilder: (_, __, item) => AppFlowyGroupCard(
          key: ValueKey(item.id),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          boxConstraints: const BoxConstraints.tightFor(width: 260),
          child: _buildCard(item),
        ),
        footerBuilder: (_, __) => const ProjectBoardFooter(),
        headerBuilder: (_, __) => ProjectBoardHeader(__.headerData.groupName),
        groupConstraints: const BoxConstraints.tightFor(width: 270),
        config: config,
      ),
    );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is ProjectModel) {
      return ProjectBoardCard(data: item).clickable(() => context.push(ProjectDetailScreen.route));
    }
    throw UnimplementedError();
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
