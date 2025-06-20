/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:animate_do/animate_do.dart';
import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

import 'login_forgot_password_btn.dart';
import 'login_form.dart';

class LoginBody extends BaseStatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(styles(context).insets.sm),
        FadeInUp(child: const CustomAuthDivider()),
        Gap(styles(context).insets.md),
        const LoginForm(),
        const Align(
            alignment: Alignment.centerRight,
            child: LoginForgetPasswordButton()),
        Gap(styles(context).insets.xl),
        CustomPrimaryButton(
            label: 'Sign In', onTap: () => context.go(MainScreen.route)),
        Gap(styles(context).insets.md),
        OneLineClickableText(
          actionText: 'Sign Up',
          mainText: "Don't have an account?",
          onTap: () => context.push(SignupScreen.route),
        ),
      ],
    );
  }
}
