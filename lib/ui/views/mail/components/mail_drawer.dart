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

class MailDrawerOffsetNotification extends Notification {
  final Offset offset;
  final MailPageEnum type;

  MailDrawerOffsetNotification(this.type, this.offset);
}

class MailDrawer extends StatefulWidget {
  const MailDrawer({super.key});

  @override
  State<MailDrawer> createState() => _MailDrawerState();
}

class _MailDrawerState extends BaseStatefulWidget<MailDrawer> {
  MailPageEnum? _prevPage;

  /// The offset of the indicator by type.
  final Map<MailPageEnum, Offset> _offsets = {};

  double get _headerHeight => 87;

  double get _indicatorHeight => 30;

  double get _btnHeight => 60;

  double _indicatorY = 0.0;

  void _onPageChanged(MailPageEnum pageType) {
    context.read<MailProvider>().mailPage = pageType;
  }

  void _updatePosition(MailPageEnum type, {Offset? offset}) {
    if (!_offsets.containsKey(type)) {
      _offsets[type] = offset ?? Offset.zero;
    }

    if (_offsets.containsKey(type)) {
      Offset o = _offsets[type] ?? Offset.zero;
      setState(() => _indicatorY = o.dy - _headerHeight + _btnHeight * .5 - _indicatorHeight * .5);
    }

    if (_indicatorY.isNegative) {
      _indicatorY = 30.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var page = context.select<MailProvider, MailPageEnum>((value) => value.mailPage);

    if (page != _prevPage) _updatePosition(page);

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
                  NotificationListener<MailDrawerOffsetNotification>(
                    onNotification: (n) {
                      _offsets[n.type] = n.offset;
                      return true;
                    },
                    child: Column(
                      children: [
                        MailDrawerItem(
                            title: 'Inbox',
                            icon: Assets.images.icons.inbox,
                            isSelected: page == MailPageEnum.inbox,
                            onTap: () => _onPageChanged(MailPageEnum.inbox),
                            height: _btnHeight,
                            getPosition: (o) => _updatePosition(MailPageEnum.inbox, offset: o),
                            trailing: const CustomBadge('29')),
                        MailDrawerItem(
                            title: 'Sent',
                            icon: Assets.images.icons.plane,
                            isSelected: page == MailPageEnum.sent,
                            onTap: () => _onPageChanged(MailPageEnum.sent),
                            getPosition: (o) => _updatePosition(MailPageEnum.sent, offset: o),
                            height: _btnHeight),
                        MailDrawerItem(
                            title: 'Starred',
                            icon: Assets.images.icons.star,
                            isSelected: page == MailPageEnum.stared,
                            onTap: () => _onPageChanged(MailPageEnum.stared),
                            getPosition: (o) => _updatePosition(MailPageEnum.stared, offset: o),
                            height: _btnHeight),
                        MailDrawerItem(
                            title: 'Draft',
                            icon: Assets.images.icons.file,
                            isSelected: page == MailPageEnum.drafts,
                            onTap: () => _onPageChanged(MailPageEnum.drafts),
                            getPosition: (o) => _updatePosition(MailPageEnum.drafts, offset: o),
                            height: _btnHeight),
                        MailDrawerItem(
                            title: 'Trash',
                            icon: Assets.images.icons.trash,
                            isSelected: page == MailPageEnum.trash,
                            onTap: () => _onPageChanged(MailPageEnum.trash),
                            getPosition: (o) => _updatePosition(MailPageEnum.trash, offset: o),
                            height: _btnHeight),
                      ],
                    ),
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
                          Text('New Chat', style: styles.text.b1.textColor(styles.theme.grey6)),
                        ],
                      ),
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
