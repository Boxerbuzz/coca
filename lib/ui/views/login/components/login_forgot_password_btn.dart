/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';

import '../../forgot_password/forgot_password_screen.dart';

class LoginForgetPasswordButton extends StatelessWidget {
  const LoginForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.push(const ForgotPasswordScreen()),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: context.styles.insets.xs),
        minimumSize: Size.zero,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Forgot Password?',
            style: context.styles.text.b1.textColor(kBlue),
          ),
        ],
      ),
    );
  }
}
