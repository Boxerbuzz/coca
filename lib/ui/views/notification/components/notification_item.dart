/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.data});
  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: styles.theme.silver))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (data.avatar.isEmpty) ...{
            CustomIconButton(
              icon: Assets.images.icons.bell,
              bgColor: styles.theme.grey2,
              size: 48,
              onPressed: () {},
            ),
          },
          if (data.avatar.isNotEmpty) ...{
            Hero(tag: data.id, child: CustomAvatar(user: UserModel(image: data.avatar, firstName: data.subject))),
          },
          Gap(styles.insets.btn),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LinkifyText(data.subject,
                    linkTypes: const [LinkType.userTag],
                    linkStyle: styles.text.t2.bold.textColor(styles.theme.blue),
                    textStyle: styles.text.t2.bold.textColor(styles.theme.grey8)),
                if (data.content.isNotEmpty) ...{
                  Gap(styles.insets.xxs),
                  LinkifyText(data.content,
                      linkTypes: const [LinkType.userTag],
                      linkStyle: styles.text.caption.regular.textColor(styles.theme.blue),
                      textStyle: styles.text.caption.textColor(styles.theme.grey5)),
                },
                Gap(styles.insets.xs),
                if (data.containsPictures) ...{
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Assets.images.puzzle.provider(), fit: BoxFit.cover),
                      borderRadius: styles.corners.br12,
                      boxShadow: styles.shadows.custom(styles.theme.silver, .4),
                    ),
                  ),
                  Gap(styles.insets.btn),
                },
                Text(data.time, style: styles.text.b2.textColor(styles.theme.grey4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
