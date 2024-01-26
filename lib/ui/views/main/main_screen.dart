/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';
import 'components/main_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static String route = '/main_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return Scaffold(
          body: CustomIndexedStack(index: store.pageIndex, children: store.screens),
          bottomNavigationBar: const MainNavBar(),
        );
      },
    );
  }
}
