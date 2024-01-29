/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/home_app_bar.dart';
import 'components/home_recent_project_list.dart';
import 'components/home_task_list.dart';
import 'components/home_workspace_stats.dart';
import 'components/home_workspace_switcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final ScrollController _ctrl = ScrollController();
  double _opacity = 0.0;

  @override
  void initState() {
    _controller = AnimationController(duration: 600.milliseconds, vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    _ctrl.addListener(() {
      if (_ctrl.offset >= 24) {
        if (_opacity != 1.0) {
          setState(() {
            _opacity = 1.0;
          });
        }
      } else if (_ctrl.offset <= 24 && _ctrl.offset >= 0) {
        if (_opacity != _ctrl.offset / 24) {
          setState(() {
            _opacity = _ctrl.offset / 24;
          });
        }
      } else if (_ctrl.offset <= 0) {
        if (_opacity != 0.0) {
          setState(() {
            _opacity = 0.0;
          });
        }
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return Stack(
          children: [
            SingleChildScrollView(
              controller: _ctrl,
              padding: EdgeInsets.only(top: AppBar().preferredSize.height + 30),
              child: Column(
                children: [
                  HomeWorkspaceSwitcher(workspace: store.workspace ?? workspaces.first),
                  Gap(styles.insets.md),
                  const HomeWorkspaceStats(),
                  Gap(styles.insets.md),
                  const HomeRecentProjectList(),
                  Gap(styles.insets.md),
                  const HomeTaskList(),
                ],
              ),
            ),
            HomeAppBar(animation: _animation, controller: _controller, opacity: _opacity),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _controller.dispose();
    super.dispose();
  }
}
