/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';
import 'components/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(72),
            const AuthHeader(headerText: 'Welcome Back!', subHeaderText: 'Sign In to your account'),
            GoogleButton(label: 'Sign in with Google', onPressed: () {}),
            const LoginBody()
          ],
        ),
      ),
    );
  }
}