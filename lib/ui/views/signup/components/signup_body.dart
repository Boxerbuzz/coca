/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'signup_agreement.dart';
import 'signup_form.dart';

class SignupBody extends BaseStatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(styles(context).insets.sm),
        const CustomAuthDivider(),
        Gap(styles(context).insets.md),
        const SignupForm(),
        const Gap(16),
        const SignupAgreement(),
        Gap(styles(context).insets.xl),
        CustomPrimaryButton(label: 'Sign Up', onTap: () => context.push(OtpScreen.route)),
        Gap(styles(context).insets.md),
        OneLineClickableText(
          actionText: 'Sign In',
          mainText: "Have an account?",
          onTap: () => context.go(LoginScreen.route),
        ),
      ],
    );
  }
}
