/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../coca.dart';

class CustomScrollBehaviour extends ScrollBehavior {
  @override
  // Add mouse drag on desktop for easier responsive testing
  Set<PointerDeviceKind> get dragDevices {
    final devices = Set<PointerDeviceKind>.from(super.dragDevices);
    devices.add(PointerDeviceKind.mouse);
    return devices;
  }

  // Use bouncing physics on all platforms, better matches the design of the app
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const BouncingScrollPhysics();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return Platform.isAndroid
        ? RawScrollbar(
            controller: details.controller,
            trackVisibility: false,
            radius: Radius.circular(styles.corners.sm),
            trackColor: styles.theme.white,
            thumbColor: styles.theme.blue,
            thickness: 0,
            child: child)
        : CupertinoScrollbar(controller: details.controller, child: child);
  }
}
