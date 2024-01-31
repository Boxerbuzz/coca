/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../enums/notification_type_enum.dart';
import '../models/notification_model.dart';

final List<NotificationModel> notifications = <NotificationModel>[
  const NotificationModel(
      id: '1',
      subject: 'Redesign  Website',
      content: "@Jeffery commented: 'bro @boxerbuzz could we kindly find some time to sync within the week'",
      time: '2 hrs ago',
      type: NotificationType.following,
      isRead: false),
  const NotificationModel(
      id: '2',
      subject: 'Coca Landing Page Kit',
      content: '@Judith mentioned you in the task description',
      time: '8 hours ago',
      type: NotificationType.mention,
      isRead: false),
  const NotificationModel(
      id: '3',
      subject: '@Gabriel assigned you to a task',
      content: 'Visualize Compression Module with Twin Motion',
      time: 'Yesterday at 10:00 AM',
      isRead: true,
      avatar: 'https://randomuser.me/api/portraits/men/53.jpg'),
  const NotificationModel(
      id: '4',
      subject: "@Rachel mentioned you in a comment on Brainstorming Task",
      time: "Yesterday at 07:50 AM",
      isRead: true,
      hasAttachment: true,
      containsPictures: true,
      avatar: 'https://randomuser.me/api/portraits/women/83.jpg'),
];
