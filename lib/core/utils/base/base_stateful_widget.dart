/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../core.dart';

abstract class BaseStatefulWidget<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {
  late CustomAppStyles styles;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    styles = CustomAppStyles(screenSize: MediaQuery.of(context).size);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
