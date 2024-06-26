/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/project_switcher_model.dart';
import 'project_view_switcher_item.dart';

class ProjectViewSwitcher extends BaseStatelessWidget {
  const ProjectViewSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, store, child) {
        return CustomDropdownButton(
          buttonBuilder: (_, __) => DropdownButtonContent(
            value: store.display.name,
            icon: Assets.images.icons.columns,
          ),
          menuBuilder: (_, __) {
            return DropDownListMenu(
              bCenterOriginTabOnPivot: true,
              minHeight: 150,
              originTabBuilder: (_, __) => DropdownButtonContent(
                value: store.display.name,
                icon: Assets.images.icons.columns,
                isOpen: __,
              ),
              bIsScrollable: false,
              padding: EdgeInsets.all(styles(context).insets.xs),
              separator: Gap(styles(context).insets.xs),
              children: [
                ...displays.map(
                  (e) {
                    return ProjectViewSwitcherItem(
                      icon: e.icon,
                      label: e.name,
                      isSelected: e.name.toLowerCase() == store.display.name.toLowerCase(),
                      onPressed: () {
                        store.display = ProjectDisplayEnum.values.firstWhere(
                          (element) => element.name.toLowerCase() == e.name.toLowerCase(),
                        );
                        context.pop();
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void close(BuildContext context) => Navigator.of(context).pop();
}
