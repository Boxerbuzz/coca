/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class LoginForm extends BaseStatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFieldWithIcon(
              labelText: 'Type your email', hintText: 'Email', prefixIcon: Assets.images.icons.mail.svg()),
          const Gap(16),
          CustomTextFieldWithIcon(
              labelText: 'Type your password',
              hintText: 'Password',
              prefixIcon: Assets.images.icons.lock.svg(),
              suffixIcon: Assets.images.icons.eyeOff.svg()),
          const Gap(16),
        ],
      ),
    );
  }
}
