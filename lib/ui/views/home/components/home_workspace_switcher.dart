/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../switch_workspace/switch_workspace_screen.dart';

class HomeWorkspaceSwitcher extends BaseStatelessWidget {
  const HomeWorkspaceSwitcher({super.key, required this.workspace});
  final WorkspaceModel workspace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
      child: InkWell(
        onTap: () => showMaterialModalBottomSheet(context: context, builder: (_) => const SwitchWorkspaceScreen()),
        child: Container(
          width: double.infinity,
          decoration:
              BoxDecoration(borderRadius: styles(context).corners.br16, gradient: styles(context).gradients.primary),
          padding: EdgeInsets.all(styles(context).insets.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(styles(context).insets.xs),
                child: Text(
                  'Workspace',
                  style: styles(context).text.t1.textColor(styles(context).theme.white.withOpacity(.5)),
                ),
              ),
              Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: styles(context).corners.br14, color: styles(context).theme.white),
                padding: EdgeInsets.all(styles(context).insets.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            borderRadius: styles(context).corners.br8,
                            color: styles(context).theme.white,
                            boxShadow: styles(context).shadows.sm,
                            border: Border.all(color: styles(context).theme.silver),
                          ),
                          padding: const EdgeInsets.all(2.0),
                          child: CustomSvg(workspace.image).svg(),
                        ),
                        Gap(styles(context).insets.sm),
                        Text(workspace.name, style: styles(context).text.t1),
                        Expanded(child: Container()),
                        CustomSvg(Assets.images.icons.arrowDown)
                            .svg(height: 24, width: 24, color: styles(context).theme.grey7)
                      ],
                    ),
                    Gap(styles(context).insets.btn),
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
