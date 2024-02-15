/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/login_body.dart';

class LoginScreen extends BaseStatelessWidget {
  const LoginScreen({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAuthHeader(headerText: 'Welcome Back!', subHeaderText: 'Sign In to your account'),
            CustomGoogleButton(label: 'Sign in with Google', onPressed: () {}),
            const LoginBody()
          ],
        ),
      ),
    );
  }
}
