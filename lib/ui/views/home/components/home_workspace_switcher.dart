/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../switch_workspace/switch_workspace_screen.dart';

class HomeWorkspaceSwitcher extends StatelessWidget {
  const HomeWorkspaceSwitcher({super.key, required this.workspace});
  final WorkspaceModel workspace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      child: InkWell(
        onTap: () => showMaterialModalBottomSheet(context: context, builder: (_) => const SwitchWorkspaceScreen()),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: styles.corners.br16, gradient: styles.gradients.primary),
          padding: EdgeInsets.all(styles.insets.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(styles.insets.xs),
                child: Text(
                  'Workspace',
                  style: styles.text.t1.textColor(styles.theme.white.withOpacity(.5)),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: styles.corners.br14, color: styles.theme.white),
                padding: EdgeInsets.all(styles.insets.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            borderRadius: styles.corners.br8,
                            color: styles.theme.white,
                            boxShadow: styles.shadows.sm,
                            border: Border.all(color: styles.theme.silver),
                          ),
                          padding: const EdgeInsets.all(2.0),
                          child: SvgGenImage(workspace.image).svg(),
                        ),
                        Gap(styles.insets.sm),
                        Text(workspace.name, style: styles.text.t1),
                        Expanded(child: Container()),
                        Assets.images.icons.arrowDown.svg(height: 24, width: 24),
                      ],
                    ),
                    Gap(styles.insets.btn),
                    CustomAvatarPile(users: workspace.participants, size: 36),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
