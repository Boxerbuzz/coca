/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/main_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String route = '/main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(),
      bottomNavigationBar: MainNavBar(),
    );
  }
}
