/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'create_email_field.dart';
import 'create_mail_message_body.dart';
import 'create_mail_subject_section.dart';

class CreateMailBody extends BaseStatelessWidget {
  const CreateMailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CreateMailInputField(),
        CreateMailSubjectSection(),
        CreateMailMessageBody(),
      ],
    );
  }
}
