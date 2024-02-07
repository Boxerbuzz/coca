/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

class MailModel extends Equatable {
  const MailModel(this.sender, this.time, this.subject, this.message, this.avatar, this.recipients, this.hasAttachment,
      this.containsPictures, this.isRead);

  final String sender;
  final String time;
  final String subject;
  final String message;
  final String avatar;
  final String recipients;
  final bool hasAttachment;
  final bool containsPictures;
  final bool isRead;

  @override
  List<Object?> get props =>
      [sender, time, subject, message, avatar, recipients, hasAttachment, containsPictures, isRead];
}
