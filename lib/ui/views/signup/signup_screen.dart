/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/signup_body.dart';

class SignupScreen extends BaseStatelessWidget {
  const SignupScreen({super.key});

  static String route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAuthHeader(headerText: 'Sign Up', subHeaderText: 'Create an account to continue'),
            CustomGoogleButton(label: 'Sign Up with Google', onPressed: () {}),
            const SignupBody(),
          ],
        ),
      ),
    );
  }
}
