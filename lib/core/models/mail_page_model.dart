/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../enums/mail_pages_enum.dart';

class MailPageModel extends Equatable {
  final String title;
  final Offset offset;
  final MailPageEnum type;

  const MailPageModel(this.title, this.offset, this.type);

  MailPageModel copyWith({String? title, Offset? offset, MailPageEnum? type}) {
    return MailPageModel(
      title ?? this.title,
      offset ?? this.offset,
      type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [title, offset, type];
}
