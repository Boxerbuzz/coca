/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:equatable/equatable.dart';

import '../enums/policy_text_enum.dart';

class PolicyModel extends Equatable {
  /// if the text being processed is a header, sub text or paragraph.
  final PolicyTextEnum? type;

  /// Text to be rendered.
  final String text;

  /// Sub text under a paragraph [text] when [type] = [PolicyTextEnum.sub].
  final List<PolicyModel>? subs;

  /// optionally needed for numbered sub text [subs].
  final String? numbering;

  const PolicyModel({required this.type, required this.text, this.subs, this.numbering});

  @override
  List<Object?> get props => [type, text, subs, numbering];
}
