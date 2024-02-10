/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_app_button.dart';

class ProfileDeleteAccountModal extends BaseStatelessWidget {
  const ProfileDeleteAccountModal({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetLayout(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
        child: Column(
          children: [
            Gap(styles(context).insets.md),
            Text('Delete Account & Data', style: styles(context).text.h3),
            const Gap(13),
            Text(
              'Please be aware that this action is irreversible. By proceeding, you will permanently lose access to your account and all associated data, including profile, project, created organizations, saved items,purchase history, etc..',
              style: styles(context).text.t2.textColor(styles(context).theme.grey4).regular,
              textAlign: TextAlign.center,
            ),
            Gap(styles(context).insets.md),
            SizedBox(
              height: 48,
              child: CustomAppButton(
                onPressed: () {},
                expand: true,
                bgColor: styles(context).theme.red,
                child: Text('Delete Account', style: styles(context).text.b1),
              ),
            ),
            Gap(styles(context).insets.md),
            CustomAppButton(
                onPressed: () => context.pop(),
                bgColor: Colors.transparent,
                child: Text('Cancel', style: styles(context).text.b1.textColor(styles(context).theme.grey7))),
            Gap(styles(context).insets.lg),
          ],
        ),
      ),
    );
  }
}
