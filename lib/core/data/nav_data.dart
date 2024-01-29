/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../models/nav_model.dart';

final List<NavModel> nav = [
  NavModel(title: 'Home', route: '/home', icon: 'assets/images/icons/home.svg', index: 0),
  NavModel(title: 'Projects', route: '/projects', icon: 'assets/images/icons/agenda.svg', index: 1),
  NavModel(title: 'Create', route: '/create', icon: 'assets/images/icons/plus.svg', index: 2),
  NavModel(title: 'Chat', route: '/chat', icon: 'assets/images/icons/message.svg', index: 3),
  NavModel(title: 'Profile', route: '/profile', icon: 'assets/images/icons/person.svg', index: 4),
];
