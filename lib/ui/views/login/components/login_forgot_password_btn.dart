/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class LoginForgetPasswordButton extends StatelessWidget {
  const LoginForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(ForgotPasswordScreen.route),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: styles.insets.xs),
        minimumSize: Size.zero,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Forgot Password?',
            style: styles.text.b1.textColor(styles.theme.blue),
          ),
        ],
      ),
    );
  }
}
