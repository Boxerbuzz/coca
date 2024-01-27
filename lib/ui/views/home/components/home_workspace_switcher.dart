/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import '../../switch_workspace/switch_workspace_screen.dart';

class HomeWorkspaceSwitcher extends StatefulWidget {
  const HomeWorkspaceSwitcher({super.key});

  @override
  State<HomeWorkspaceSwitcher> createState() => _HomeWorkspaceSwitcherState();
}

class _HomeWorkspaceSwitcherState extends State<HomeWorkspaceSwitcher> {
  @override
  void initState() {
    MainProvider store = context.read<MainProvider>();
    store.activeWorkspace = store.workspaces.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return InkWell(
          onTap: () => showMaterialModalBottomSheet(context: context, builder: (_) => const SwitchWorkspaceScreen()),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: styles.corners.br16,
              gradient: styles.gradients.primary,
            ),
            padding: EdgeInsets.all(styles.insets.xs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(styles.insets.xs),
                  child: Text(
                    'Workspace',
                    style: styles.text.t1.textColor(kWhite.withOpacity(.5)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: styles.corners.br14, color: kWhite),
                  padding: EdgeInsets.all(styles.insets.sm),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                borderRadius: styles.corners.br8,
                                color: kWhite,
                                boxShadow: styles.shadows.sm,
                                border: Border.all(color: kSilver)),
                            child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Assets.images.logo.suteki.svg(fit: BoxFit.contain)),
                          ),
                          Gap(styles.insets.sm),
                          Text(store.activeWorkspace?.name ?? "San Designs", style: styles.text.t1),
                          Expanded(child: Container()),
                          Assets.images.icons.arrowDown.svg(height: 24, width: 24),
                        ],
                      ),
                      Gap(styles.insets.btn),
                      CustomAvatarPile(urls: [
                        Assets.images.avatar.user.path,
                        Assets.images.avatar.avatarEight.path,
                        Assets.images.avatar.avatarTwo.path,
                        Assets.images.avatar.avatarSeven.path,
                        Assets.images.avatar.avatarFive.path,
                      ], size: 36, isLocalImage: true, overlapPercent: .2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
