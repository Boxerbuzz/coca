/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(styles.insets.md),
              CustomAvatar(user: store.user, size: 120, bg: styles.theme.grey3),
              Text('${store.user?.firstName} ${store.user?.lastName}', style: styles.text.h1),
              Row(
                children: [
                  Expanded(
                    child: Text('${store.user?.email}',
                        style: styles.text.caption.textColor(styles.theme.grey4), overflow: TextOverflow.ellipsis),
                  ),
                  CustomIconButton(
                      icon: Assets.images.icons.bell,
                      onPressed: () => context.push(NotificationScreen.route),
                      bgColor: styles.theme.grey2,
                      size: 48),
                  Gap(styles.insets.sm),
                  CustomIconButton(
                      icon: Assets.images.icons.edit, onPressed: () {}, bgColor: styles.theme.grey2, size: 48),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
