/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/policy_body.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  static const String route = '/policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Privacy Policy', trailing: CustomIconButton(icon: Assets.images.icons.share.path, onPressed: () {})),
      body: const PolicyBody(),
    );
  }
}
