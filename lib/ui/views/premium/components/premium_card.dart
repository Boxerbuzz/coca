/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'premium_card_item.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key, required this.data});
  final PremiumModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: styles.insets.sm, top: styles.insets.md, bottom: styles.insets.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: styles.corners.br16,
        border: Border.all(color: styles.theme.blue, width: 2),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: styles.theme.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(styles.corners.sm),
                topRight: Radius.circular(styles.corners.sm),
              ),
            ),
            padding: EdgeInsets.all(styles.insets.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('\$', style: styles.text.p.textColor(styles.theme.white)),
                    Text('${data.price}', style: styles.text.h1.textColor(styles.theme.white)),
                    Gap(styles.insets.xxs),
                    Text('/Monthly', style: styles.text.p.textColor(styles.theme.white)),
                  ],
                ),
                Gap(styles.insets.xs),
                Text('Billed monthly without trail', style: styles.text.t2.textColor(styles.theme.white).regular),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(styles.insets.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PremiumCardItem(
                    text: 'Unlimited Projects',
                    icon: Assets.images.icons.box,
                    subTittle: 'Limits has got nothing on you'),
                PremiumCardItem(
                    text: 'Unlimited Members',
                    icon: Assets.images.icons.users1,
                    subTittle: 'No limits to members invite'),
                PremiumCardItem(
                    text: 'Unlimited File Uploads',
                    icon: Assets.images.icons.upload,
                    subTittle: 'No limits on project file uploads'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
            child: CustomPrimaryButton(label: 'Start your 14-days trial', onTap: () {}),
          ),
          Gap(styles.insets.md),
        ],
      ),
    );
  }
}
