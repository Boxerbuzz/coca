/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../coca.dart';
import 'coca_scaffold.dart';
import 'views/otp/components/otp_success_modal.dart';

/// Routing table, matches string paths to UI Screens, optionally parses pathParameters from the paths
final routes = GoRouter(
  redirect: _redirect,
  routes: [
    ShellRoute(
      builder: (context, router, navigator) => CocaScaffold(child: navigator),
      routes: [
        AppRouter(OnboardingScreen.route, (_) => const OnboardingScreen()), // This will be hidden
        AppRouter(MainScreen.route, (_) => const MainScreen()),
        AppRouter(LoginScreen.route, (s) => const LoginScreen()),
        AppRouter(SignupScreen.route, (s) => const SignupScreen()),
        AppRouter(NotificationScreen.route, (s) => const NotificationScreen()),
        AppRouter(OtpScreen.route, (s) => const OtpScreen()),
        AppRouter(OtpSuccessModal.route, (s) => const OtpSuccessModal()),
        AppRouter(PremiumScreen.route, (s) => const PremiumScreen()),
        AppRouter(ForgotPasswordScreen.route, (s) => const ForgotPasswordScreen()),
        AppRouter(HelpScreen.route, (s) => const HelpScreen()),
        AppRouter(PolicyScreen.route, (s) => const PolicyScreen()),
      ],
    ),
  ],
);

String? _redirect(BuildContext context, GoRouterState state) {
  bool isBootstrapComplete = true;
  if (isBootstrapComplete == false && state.matchedLocation != OnboardingScreen.route) return OnboardingScreen.route;
  debugPrint('Navigate to: ${state.matchedLocation}');
  return null;
}

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRouter extends GoRoute {
  final bool useFade;
  AppRouter(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(body: builder(state), resizeToAvoidBottomInset: false);
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
}
