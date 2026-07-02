import 'package:flutter/material.dart';

import '../../features/auth/login_page.dart';
import '../../features/dashboard/dashboard_page.dart';

class AppRouter {
  const AppRouter._();

  static const login = '/';
  static const dashboard = '/dashboard';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) {
        switch (settings.name) {
          case dashboard:
            return const DashboardPage();
          case login:
          default:
            return const LoginPage();
        }
      },
    );
  }
}
