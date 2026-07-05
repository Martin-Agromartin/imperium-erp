import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';

class Approuter {
  Approuter._();
  static final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: "/",
        builder: (_, _) => const SplashPage(),
      ),
      GoRoute(
        path: "/dashboard",
        builder: (_, _) => const DashboardPage(),
          ],
  );
}

class ImperiumApp extends StatelessWidget {
  const ImperiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'Imperium ERP',

      theme: AppTheme.lightTheme,

      routerConfig: AppRouter.router,
    );
  }
}