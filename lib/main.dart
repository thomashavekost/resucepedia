import 'package:RescuePedia/pages/auth/auth_page.dart';
import 'package:RescuePedia/pages/home_page.dart';
import 'package:RescuePedia/providers/medications_provider.dart';
import 'package:RescuePedia/res/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<MedicationProvider>(create: (BuildContext context) => MedicationProvider()),
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MedicPedia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.rescuepediaTheme,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }

  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) => HomePage()
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => const AuthPage()
    )
  ]);
}

