import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'coca.dart';
import 'ui/app_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await loadShaders();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => MainProvider()),
    ChangeNotifierProvider(create: (_) => TaskProvider()),
    ChangeNotifierProvider(create: (_) => ProjectProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
  ], child: const CocaApp()));

  FlutterNativeSplash.remove();
}

class CocaApp extends StatelessWidget {
  const CocaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: routes.routeInformationProvider,
      routeInformationParser: routes.routeInformationParser,
      debugShowCheckedModeBanner: false,
      routerDelegate: routes.routerDelegate,
      theme: ThemeData(fontFamily: styles.text.urbanist.fontFamily, useMaterial3: true),
    );
  }
}

CustomAppStyles styles = CustomAppStyles();
