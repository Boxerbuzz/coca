/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/app_bar/custom_back_button.dart';
import 'mail_chat_item.dart';
import 'mail_drawer_indicator.dart';
import 'mail_drawer_item.dart';
import 'mail_drawer_section.dart';

class MailDrawer extends StatefulWidget {
  const MailDrawer({super.key});

  @override
  State<MailDrawer> createState() => _MailDrawerState();
}

class _MailDrawerState extends BaseStatefulWidget<MailDrawer> {
  MailPageModel? _prevPage;

  /// The offset of the indicator by type.
  late final MailPageModel _page;

  double get _headerHeight => 87;

  double get _indicatorHeight => 30;

  double get _btnHeight => 60;

  double _indicatorY = 0.0;

  void _updatePosition(MailPageEnum type, {Offset? offset}) {
    setState(() => _indicatorY = (offset?.dy ?? 0) - _headerHeight + _btnHeight * .5 - _indicatorHeight * .5);

    if (_indicatorY.isNegative) {
      _indicatorY = 30.0;
    }

    context.read<MailProvider>().mailPage = _page.copyWith(type: type, offset: offset ?? Offset.zero);
  }

  @override
  void initState() {
    _page = context.read<MailProvider>().mailPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var page = context.select<MailProvider, MailPageModel>((value) => value.mailPage);

    if (page != _prevPage) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _updatePosition(page.type, offset: page.offset);
      });
    }

    _prevPage = page;

    return FocusTraversalGroup(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: styles.theme.silver)),
                  color: styles.theme.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomBackButton.close(onPressed: () => context.read<MailProvider>().toggleDrawer()),
              ),
            ],
          ).height(_headerHeight),
          Stack(
            children: <Widget>[
              Container(color: styles.theme.white),
              Column(
                children: <Widget>[
                  Column(
                    children: [
                      MailDrawerItem(
                          title: 'Inbox',
                          icon: Assets.images.icons.inbox,
                          isSelected: page.type == MailPageEnum.inbox,
                          height: _btnHeight,
                          getPosition: (o) => _updatePosition(MailPageEnum.inbox, offset: o),
                          trailing: const CustomBadge('29')),
                      MailDrawerItem(
                          title: 'Sent',
                          icon: Assets.images.icons.plane,
                          isSelected: page.type == MailPageEnum.sent,
                          getPosition: (o) => _updatePosition(MailPageEnum.sent, offset: o),
                          height: _btnHeight),
                      MailDrawerItem(
                          title: 'Starred',
                          icon: Assets.images.icons.star,
                          isSelected: page.type == MailPageEnum.stared,
                          getPosition: (o) => _updatePosition(MailPageEnum.stared, offset: o),
                          height: _btnHeight),
                      MailDrawerItem(
                          title: 'Draft',
                          icon: Assets.images.icons.file,
                          isSelected: page.type == MailPageEnum.drafts,
                          getPosition: (o) => _updatePosition(MailPageEnum.drafts, offset: o),
                          height: _btnHeight),
                      MailDrawerItem(
                          title: 'Trash',
                          icon: Assets.images.icons.trash,
                          isSelected: page.type == MailPageEnum.trash,
                          getPosition: (o) => _updatePosition(MailPageEnum.trash, offset: o),
                          height: _btnHeight),
                    ],
                  ),
                  Divider(color: styles.theme.silver),
                  MailDrawerSection(
                    title: 'RECENT CONVERSATION',
                    isExpanded: true,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(color: styles.theme.blue, borderRadius: styles.corners.br24),
                            child: CustomSvg(Assets.images.icons.plus).svg(size: 24),
                          ),
                          const Gap(10),
                          Text('New Conversation', style: styles.text.b1.textColor(styles.theme.grey6)),
                        ],
                      ).clickable(() => context.push(ChatScreen.route)),
                      const Gap(10),
                      ...participants(count: 2).map((e) => MailChatItem(e)),
                    ],
                  ),
                ],
              ).padding(all: styles.insets.sm, bottom: styles.insets.sm).constrained(maxWidth: 280),
              MailDrawerItemIndicator(_indicatorY, height: _indicatorHeight)
            ],
          ).flexible(),
        ],
      ),
    );
  }
}
