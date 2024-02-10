/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';
import '../misc/project_layout_data.dart';
import '../misc/project_layout_model.dart';

class CreateProjectLayoutSelector extends StatefulWidget {
  const CreateProjectLayoutSelector({super.key, required this.onChanged});

  final ValueChanged<ProjectLayoutModel> onChanged;

  @override
  State<CreateProjectLayoutSelector> createState() => _CreateProjectLayoutSelectorState();
}

class _CreateProjectLayoutSelectorState extends BaseStatefulWidget<CreateProjectLayoutSelector> {
  ProjectLayoutModel? _selectedLayout;

  @override
  void initState() {
    _selectedLayout = layouts.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Layout', style: styles.text.t1),
        const Gap(12),
        Row(
          children: [
            ...layouts.map(
              (e) {
                final isSelected = _selectedLayout == e;

                int index = layouts.indexOf(e);

                if (index.isOdd) return const Gap(16);

                return Expanded(
                  child: CustomButtonWithIcon(
                    text: e.name,
                    icon: e.icon,
                    border: BorderSide(color: isSelected ? styles.theme.blue : styles.theme.silver),
                    btnColor: styles.theme.white,
                    iconColor: isSelected ? styles.theme.blue : styles.theme.grey4,
                    txtColor: isSelected ? styles.theme.blue : styles.theme.grey4,
                    onPressed: () {
                      setState(() {
                        _selectedLayout = e;
                      });
                      widget.onChanged(e);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
