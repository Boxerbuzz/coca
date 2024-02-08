/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/create_mail_body.dart';

class CreateMailScreen extends StatefulWidget {
  const CreateMailScreen({super.key});

  static String route = '/create_mail';

  @override
  State<CreateMailScreen> createState() => _CreateMailScreenState();
}

class _CreateMailScreenState extends State<CreateMailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'New Message'),
      body: CreateMailBody(),
    );
  }
}
