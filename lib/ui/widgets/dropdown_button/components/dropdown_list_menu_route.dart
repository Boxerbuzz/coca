/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_dropdown_button.dart';
import '../model/dropdown_list_placement_model.dart';

/// A route that displays the drop-down menu popup and positions it.
class DropDownListMenuRoute<T> extends PopupRoute<T> {
  DropDownListMenuRoute({required this.placement, required this.builder});

  final DropDownListPlacementModel placement;
  final DropDownListMenuBuilder builder;

  @override
  Color? get barrierColor => Colors.black38;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 100);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Builder(
      builder: (BuildContext context) {
        return Provider(
          create: (context) => placement,
          child: builder(context),
        );
      },
    );
  }
}
