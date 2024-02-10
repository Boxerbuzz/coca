/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProfileInfoSection extends BaseStatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(styles(context).insets.md),
              CustomAvatar(user: store.user, size: 120, bg: styles(context).theme.grey3),
              Text('${store.user?.firstName} ${store.user?.lastName}', style: styles(context).text.h1),
              Row(
                children: [
                  Expanded(
                    child: Text('${store.user?.email}',
                        style: styles(context).text.caption.textColor(styles(context).theme.grey4),
                        overflow: TextOverflow.ellipsis),
                  ),
                  CustomIconButton(
                      icon: Assets.images.icons.bell,
                      onPressed: () => context.push(NotificationScreen.route),
                      bgColor: styles(context).theme.grey2,
                      size: 48),
                  Gap(styles(context).insets.sm),
                  CustomIconButton(
                      icon: Assets.images.icons.edit, onPressed: () {}, bgColor: styles(context).theme.grey2, size: 48),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
