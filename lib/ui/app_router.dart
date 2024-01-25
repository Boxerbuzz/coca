/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'coca.dart';

class AppRouter {
  const AppRouter({required this.createScreen});

  /// A function to create the screen widget for the route.
  final Widget Function(BuildContext context) createScreen;

  /// A list of all routes in the app.
  static final Map<String, AppRouter> allRoutes = {
    HomeScreen.route: AppRouter(createScreen: (context) => const HomeScreen()),
    LoginScreen.route: AppRouter(createScreen: (context) => const LoginScreen()),
    ForgotPasswordScreen.route: AppRouter(createScreen: (context) => const ForgotPasswordScreen()),
    SignupScreen.route: AppRouter(createScreen: (context) => const SignupScreen()),
    OtpScreen.route: AppRouter(createScreen: (context) => const OtpScreen()),
    OnboardingScreen.route: AppRouter(createScreen: (context) => const OnboardingScreen()),
  };
}

final Map<String, String> routes = {};
