/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

class CocaScaffold extends StatefulWidget {
  const CocaScaffold({super.key});

  @override
  State<CocaScaffold> createState() => _CocaScaffoldState();
}

class _CocaScaffoldState extends State<CocaScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(),
    );
  }
}
