import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: AppTextTheme.textTheme,
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
    );
  }
}
