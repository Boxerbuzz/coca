/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'login_forgot_password_btn.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Column(
      children: [
        Gap(styles.insets.sm),
        const AuthDivider(),
        Gap(styles.insets.md),
        const LoginForm(),
        const Align(alignment: Alignment.centerRight, child: LoginForgetPasswordButton()),
        Gap(styles.insets.xl),
        CustomPrimaryButton(label: 'Sign In', onTap: () {}),
        Gap(styles.insets.md),
        AccountButton(
            actionText: 'Sign Up', mainText: "Don't have an account?", onTap: () => context.push(const SignupScreen())),
      ],
    );
  }
}
