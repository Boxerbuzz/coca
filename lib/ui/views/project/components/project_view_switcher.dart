/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../misc/project_switcher_model.dart';
import 'project_view_switcher_item.dart';

class ProjectViewSwitcher extends StatelessWidget {
  const ProjectViewSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, store, child) {
        return CustomDropdownButton(
          buttonBuilder: (_, __) => DropdownButtonContent(
            value: store.display.name,
            icon: Assets.images.icons.columns.path,
          ),
          menuBuilder: (_, __) {
            return DropDownListMenu(
              bCenterOriginTabOnPivot: true,
              minHeight: 150,
              originTabBuilder: (_, __) => DropdownButtonContent(
                value: store.display.name,
                icon: Assets.images.icons.columns.path,
                isOpen: __,
              ),
              bIsScrollable: false,
              children: [
                ...displays.map(
                  (e) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: displays.indexOf(e) == 0 ? 0 : styles.insets.xs),
                      child: ProjectViewSwitcherItem(
                        icon: e.icon,
                        label: e.name,
                        isSelected: e.name.toLowerCase() == store.display.name.toLowerCase(),
                        onPressed: () {
                          store.display = ProjectDisplayEnum.values.firstWhere(
                            (element) => element.name.toLowerCase() == e.name.toLowerCase(),
                          );
                          context.pop();
                        },
                      ),
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
