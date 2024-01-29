/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import '../enums/notification_type_enum.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    this.id = '',
    this.sender = '',
    this.time = '',
    this.subject = '',
    this.content = '',
    this.avatar = '',
    this.recipients = '',
    this.hasAttachment = false,
    this.containsPictures = false,
    this.isRead = false,
    this.type = NotificationType.none,
  });

  final String id;
  final String sender;
  final String time;
  final String subject;
  final String content;
  final String avatar;
  final String recipients;
  final bool hasAttachment;
  final bool containsPictures;
  final bool isRead;
  final NotificationType type;
  @override
  List<Object?> get props => [
        id,
        sender,
        time,
        subject,
        content,
        avatar,
        recipients,
        hasAttachment,
        containsPictures,
        isRead,
      ];
}
