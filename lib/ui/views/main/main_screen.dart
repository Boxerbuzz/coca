/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import '../mail/components/mail_drawer.dart';
import 'components/main_nav_bar.dart';

class MainScreen extends BaseStatelessWidget {
  const MainScreen({super.key});

  static String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Consumer2<MainProvider, MailProvider>(
      builder: (context, store, mail, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CustomIndexedStack(index: store.index, children: store.screens).padding(bottom: 90),
                    const Align(alignment: Alignment.bottomCenter, child: MainNavBar()),
                    if (mail.drawerState == MailDrawerState.open)
                      GestureDetector(
                        child: Container(color: styles(context).theme.grey7.withOpacity(.3)),
                        onTap: () => mail.toggleDrawer(),
                      ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 280,
                      bottom: 0,
                      child: const MailDrawer()
                          .animatedPanelX(closeX: 280, isClosed: mail.drawerState == MailDrawerState.close)
                          .animate(200.milliseconds, Curves.easeOut),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
