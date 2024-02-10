/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/policy_body.dart';
import 'components/policy_header.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  static const String route = '/policy';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PolicyHeader(),
      body: PolicyBody(),
    );
  }
}
