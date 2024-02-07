/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'mail_category_item.dart';
import 'mail_drawer_indicator.dart';
import 'mail_drawer_item.dart';
import 'mail_drawer_section.dart';

class MailDrawerOffsetNotification extends Notification {
  final Offset offset;
  final MailPageEnum pageType;

  MailDrawerOffsetNotification(this.pageType, this.offset);
}

class MailDrawer extends StatefulWidget {
  const MailDrawer({super.key});

  @override
  State<MailDrawer> createState() => _MailDrawerState();
}

class _MailDrawerState extends State<MailDrawer> {
  List<Map<String, dynamic>> menu = [
    {
      'title': 'Inbox',
      'icon': Assets.images.icons.inbox.path,
      'type': MailPageEnum.inbox,
    },
    {
      'title': 'Sent',
      'icon': Assets.images.icons.plane.path,
      'type': MailPageEnum.sent,
    },
    {
      'title': 'Starred',
      'icon': Assets.images.icons.star.path,
      'type': MailPageEnum.stared,
    },
    {
      'title': 'Draft',
      'icon': Assets.images.icons.file.path,
      'type': MailPageEnum.drafts,
    },
    {
      'title': 'Trash',
      'icon': Assets.images.icons.trash.path,
      'type': MailPageEnum.trash,
    },
  ];

  MailPageEnum? _prevPage;

  final Map<MailPageEnum, Offset> _menuBtnOffsetsByType = {};
  double _indicatorY = 0.0;
  double get _headerHeight => 0;

  double get _indicatorHeight => 48;

  double get _btnHeight => 60;

  @override
  void initState() {
    Future.delayed(100.milliseconds).then((value) => _updateIndicatorState(context.read<MailProvider>().mailPage));
    super.initState();
  }

  void _handlePageSelected(MailPageEnum pageType) {
    context.read<MailProvider>().mailPage = pageType;
  }

  void _updateIndicatorState(MailPageEnum type) {
    if (_menuBtnOffsetsByType.containsKey(type)) {
      Offset o = _menuBtnOffsetsByType[type] ?? Offset.zero;
      setState(() => _indicatorY = o.dy - _headerHeight + _btnHeight * .5 - _indicatorHeight * .5);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentPage = context.select<MailProvider, MailPageEnum>((value) => value.mailPage);
    if (currentPage != _prevPage) {
      _updateIndicatorState(currentPage);
    }
    _prevPage = currentPage;

    return Consumer<MailProvider>(
      builder: (_, store, __) {
        return Drawer(
          backgroundColor: styles.theme.white,
          width: 250,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: styles.insets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      NotificationListener<MailDrawerOffsetNotification>(
                        onNotification: (n) {
                          _menuBtnOffsetsByType[n.pageType] = n.offset;
                          return true;
                        },
                        child: Column(
                          children: <Widget>[
                            ...menu.map(
                              (e) => MailDrawerItem(
                                  title: e['title'] as String,
                                  icon: e['icon'] as String,
                                  isSelected: store.mailPage == e['type'] as MailPageEnum,
                                  onTap: () => _handlePageSelected(e['type'] as MailPageEnum),
                                  height: _btnHeight),
                            ),
                          ],
                        ),
                      ),
                      MailDrawerItemIndicator(_indicatorY, height: _indicatorHeight),
                    ],
                  ),
                  Divider(color: styles.theme.silver),
                  const MailDrawerSection(title: 'CATEGORIES', children: [
                    MailCategoryItem(title: 'Work', value: '2'),
                    MailCategoryItem(title: 'Personal', value: '20'),
                    MailCategoryItem(title: 'Vacation', value: '3'),
                    MailCategoryItem(title: 'Promotion', value: '100'),
                  ]),
                  Divider(color: styles.theme.silver),
                  const MailDrawerSection(title: 'RECENT CONVERSATION', children: []),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
