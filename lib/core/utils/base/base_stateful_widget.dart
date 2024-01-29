/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../core.dart';

abstract class BaseStatefulWidget<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {
  double dynamicHeight(double value) => MediaQuery.of(context).size.height * value;

  double dynamicWidth(double value) => MediaQuery.of(context).size.width * value;

  late CustomAppStyles styles;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  SizedBox spaceHeight(double height) => SizedBox(height: height);

  SizedBox spaceWidth(double width) => SizedBox(width: width);
}
