import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.orange,
        primary: AppColors.orange,
        surface: AppColors.white,
      ),
      useMaterial3: true,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.white,
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.steelDark,
        displayColor: AppColors.navy,
        fontFamily: 'Arial',
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.orange, width: 1.5),
        ),
      ),
    );
  }
}
