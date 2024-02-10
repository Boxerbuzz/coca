/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class NotificationItem extends BaseStatelessWidget {
  const NotificationItem({super.key, required this.data});
  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: styles(context).theme.silver))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (data.avatar.isEmpty) ...{
            CustomIconButton(
              icon: Assets.images.icons.bell,
              bgColor: styles(context).theme.grey2,
              size: 48,
              onPressed: () {},
            ),
          },
          if (data.avatar.isNotEmpty) ...{
            Hero(tag: data.id, child: CustomAvatar(user: UserModel(image: data.avatar, firstName: data.subject))),
          },
          Gap(styles(context).insets.btn),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LinkifyText(data.subject,
                    linkTypes: const [LinkType.userTag],
                    linkStyle: styles(context).text.t2.bold.textColor(styles(context).theme.blue),
                    textStyle: styles(context).text.t2.bold.textColor(styles(context).theme.grey8)),
                if (data.content.isNotEmpty) ...{
                  Gap(styles(context).insets.xxs),
                  LinkifyText(data.content,
                      linkTypes: const [LinkType.userTag],
                      linkStyle: styles(context).text.caption.regular.textColor(styles(context).theme.blue),
                      textStyle: styles(context).text.caption.textColor(styles(context).theme.grey5)),
                },
                Gap(styles(context).insets.xs),
                if (data.containsPictures) ...{
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Assets.images.puzzle.provider(), fit: BoxFit.cover),
                      borderRadius: styles(context).corners.br12,
                      boxShadow: styles(context).shadows.custom(styles(context).theme.silver, .4),
                    ),
                  ),
                  Gap(styles(context).insets.btn),
                },
                Text(data.time, style: styles(context).text.b2.textColor(styles(context).theme.grey4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
