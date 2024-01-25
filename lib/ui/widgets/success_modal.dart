/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';
import 'buttons/custom_secondary_button.dart';

class SuccessModal extends StatelessWidget {
  const SuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Scaffold(
      backgroundColor: kBlue,
      body: Padding(
        padding: EdgeInsets.all(styles.insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(140),
            Container(
              height: 124,
              width: 124,
              decoration: BoxDecoration(
                color: primary.shade700,
                borderRadius: BorderRadius.circular(62),
              ),
              child: Assets.images.icons.check.svg(),
            ),
            const Gap(40),
            Text('Account Verified', style: styles.text.h3.textColor(kWhite)),
            Gap(styles.insets.xs),
            Text(
              'Your account has been successfully verified and all features are at your disposal',
              style: styles.text.caption.textColor(kGray02),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(styles.insets.md),
        child: CustomSecondaryButton(
          label: 'Get Started',
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
