/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'profile_delete_account_modal.dart';
import 'profile_header.dart';
import 'profile_info_section.dart';
import 'profile_item.dart';

class ProfileBody extends BaseStatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProfileInfoSection(),
                  Gap(styles(context).insets.sm),
                  ProfileItem(
                      title: 'Upgrade to Premium',
                      icon: Assets.images.icons.premium,
                      onPressed: () => context.push(PremiumScreen.route)),
                  ProfileItem(
                      title: 'Help Center',
                      icon: Assets.images.icons.lifeBuoy,
                      onPressed: () => context.push(HelpScreen.route)),
                  ProfileItem(title: 'Customer Support', icon: Assets.images.icons.headphone, onPressed: () {}),
                  ProfileItem(title: 'Rate the App', icon: Assets.images.icons.star, onPressed: () {}),
                  ProfileItem(
                      title: 'Privacy Policy',
                      icon: Assets.images.icons.eye,
                      onPressed: () => context.push(PolicyScreen.route)),
                  ProfileItem(
                      title: 'Log out',
                      icon: Assets.images.icons.logOut,
                      onPressed: () => context.go(LoginScreen.route),
                      icColor: styles(context).theme.red,
                      txtColor: styles(context).theme.red),
                  ProfileItem(
                      title: 'Delete Account',
                      icon: Assets.images.icons.trash,
                      onPressed: () => showMaterialModalBottomSheet(
                            context: context,
                            builder: (context) => const ProfileDeleteAccountModal(),
                          ),
                      icColor: styles(context).theme.red,
                      txtColor: styles(context).theme.red),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
