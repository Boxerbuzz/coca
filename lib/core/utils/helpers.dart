/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class Helpers {
  static void getFutureSizeFromGlobalKey(GlobalKey key, Function(Size size) callback) {
    Future.microtask(() {
      Size? size = getSizeFromContext(key.currentContext);
      if (size != null) {
        callback(size);
      }
    });
  }

  static Size? getSizeFromContext(BuildContext? context) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.size;
  }

  static Offset getOffsetFromContext(BuildContext? context, [Offset? offset]) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.localToGlobal(offset ?? Offset.zero);
  }
}
