/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/create_project_body.dart';

class CreateProjectScreen extends BaseStatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBottomSheetLayout(child: CreateProjectBody());
  }
}
