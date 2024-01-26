import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'ui/app_router.dart';
import 'ui/views/views.dart';

void main() {
  runApp(const Coca());
}

class Coca extends StatefulWidget {
  const Coca({super.key});

  @override
  State<Coca> createState() => _CocaState();
}

class _CocaState extends State<Coca> {
  var routes = {for (var entry in AppRouter.allRoutes.entries) entry.key: entry.value.createScreen};

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: MaterialApp(
        title: 'Coca',
        theme: AppTheme.light(),
        home: const LoginScreen(),
        onGenerateRoute: (RouteSettings settings) {
          Widget Function(BuildContext)? pageFunction = routes[settings.name];
          if (pageFunction != null) {
            return PageRouteBuilder(
              settings: settings,
              // Add safe area on all pages to avoid overlapping the status bar
              pageBuilder: (context, animation, secondaryAnimation) => Container(
                color: Theme.of(context).colorScheme.background,
                child: SafeArea(
                  left: false,
                  right: false,
                  bottom: false,
                  top: true,
                  child: pageFunction(context),
                ),
              ),
              transitionDuration: Duration.zero,
            );
          }

          return MaterialPageRoute(builder: (_) => Text("Invalid page ${settings.name ?? "(null)"}"));
        },
      ),
    );
  }
}
