/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

class PremiumModel extends Equatable {
  final String? title;
  final String? description;
  final String? price;
  final String? duration;

  const PremiumModel({
    this.title,
    this.description,
    this.price,
    this.duration,
  });

  @override
  List<Object?> get props => [title, description, price, duration];
}
