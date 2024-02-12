/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/chat_header.dart';
import 'components/chat_list.dart';

class ChatScreen extends BaseStatelessWidget {
  const ChatScreen({super.key});

  static String route = '/chat';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChatHeader(),
      body: ChatList(),
    );
  }
}
