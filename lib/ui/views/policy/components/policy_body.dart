/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_app_button.dart';
import 'policy_item.dart';

class PolicyBody extends StatelessWidget {
  const PolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(styles.insets.md),
          CustomAppButton(
            onPressed: () {},
            bgColor: styles.theme.blue.withOpacity(.10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSvg(Assets.images.icons.calendar).svg(color: styles.theme.blue, height: 18, width: 18),
                Gap(styles.insets.xs),
                Text('Last Updated: Jan 25, 2024 - v:1.2.5', style: styles.text.b1.textColor(styles.theme.blue))
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: privacyPolicy.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return PolicyItem(data: privacyPolicy[index]);
            },
          ),
        ],
      ),
    );
  }
}
