/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import '../enums/notification_type_enum.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    this.id = '',
    this.time = '',
    this.subject = '',
    this.content = '',
    this.avatar = '',
    this.hasAttachment = false,
    this.containsPictures = false,
    this.isRead = false,
    this.type = NotificationType.none,
  });

  final String id;
  final String time;
  final String subject;
  final String content;
  final String avatar;
  final bool hasAttachment;
  final bool containsPictures;
  final bool isRead;
  final NotificationType type;
  @override
  List<Object?> get props => [
        id,
        time,
        subject,
        content,
        avatar,
        hasAttachment,
        containsPictures,
        isRead,
      ];
}
