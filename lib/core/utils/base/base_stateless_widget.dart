/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  AppStyle styles(BuildContext context) => context.styles;

  @override
  Widget build(BuildContext context) {
    return build(context);
  }
}
