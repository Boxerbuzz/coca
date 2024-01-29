/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../enums/notification_type_enum.dart';
import '../models/notification_model.dart';

final List<NotificationModel> notifications = <NotificationModel>[
  const NotificationModel(
    id: '1',
    subject: 'Redesign  Website',
    content: "Gabriel Santoso commented: 'sis @jovanca ojo lali digarap yo bengi iki dadi...'",
    time: '2 hrs ago',
    type: NotificationType.following,
    isRead: false,
  ),
  NotificationModel(id: '2'),
  NotificationModel(id: '3'),
  NotificationModel(id: '4'),
];
