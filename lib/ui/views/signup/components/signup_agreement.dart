/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../coca.dart';

class SignupAgreement extends StatelessWidget {
  const SignupAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, store, child) {
        return Row(
          children: [
            CustomCheckbox(
              value: store.tcAgreement,
              onChanged: (value) => store.tcAgreement = value,
            ),
            Gap(context.styles.insets.xxs),
            Expanded(
              child: Wrap(
                children: [
                  Text('I agree to the ', style: context.styles.text.p.textColor(kGray04)),
                  Text('Terms of Service ', style: context.styles.text.p.bold),
                  const Gap(8),
                  Text('and ', style: context.styles.text.p.textColor(kGray04)),
                  Text('Privacy Policy', style: context.styles.text.p.bold),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
