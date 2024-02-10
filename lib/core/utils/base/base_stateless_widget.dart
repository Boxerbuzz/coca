/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  CustomAppStyles styles(BuildContext context) => CustomAppStyles(screenSize: MediaQuery.of(context).size);

  @override
  Widget build(BuildContext context) {
    return build(context);
  }
}
