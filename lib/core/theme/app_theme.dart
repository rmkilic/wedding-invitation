import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class AppColors {
  static const warmCream = Color(0xFFFDF6EE);
  static const gold = Color(0xFFC9A96E);
  static const goldLight = Color(0xFFEAD9B5);
  static const goldDark = Color(0xFF9E7B4A);
  static const deepRose = Color(0xFF8B4B6B);
  static const charcoal = Color(0xFF3A3028);
  static const mutedBrown = Color(0xFF7A6B5D);
  static const darkSection = Color(0xFF1E1810);
  static const divider = Color(0xFFE5D5C0);
  static const cardWhite = Color(0xFFFFFFFF);
}

abstract final class AppTextStyles {
  static const _serif = 'Georgia';

  static const heroNames = TextStyle(
    fontFamily: _serif,
    fontSize: 46,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 2.0,
    height: 1.2,
  );

  static const heroAmpersand = TextStyle(
    fontFamily: _serif,
    fontSize: 32,
    fontWeight: FontWeight.w300,
    color: AppColors.goldLight,
    letterSpacing: 4.0,
  );

  static const heroDate = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    letterSpacing: 3.5,
  );

  static const heroVenue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.goldLight,
    letterSpacing: 2.0,
  );

  static const sectionTitle = TextStyle(
    fontFamily: _serif,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoal,
    letterSpacing: 1.5,
  );

  static const sectionTitleLight = TextStyle(
    fontFamily: _serif,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 1.5,
  );

  static const countdownValue = TextStyle(
    fontFamily: _serif,
    fontSize: 44,
    fontWeight: FontWeight.w400,
    color: AppColors.gold,
    height: 1.0,
  );

  static const countdownLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.goldLight,
    letterSpacing: 3.0,
  );

  static const eventTitle = TextStyle(
    fontFamily: _serif,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoal,
    letterSpacing: 1.0,
  );

  static const eventDetail = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedBrown,
    letterSpacing: 0.5,
    height: 1.6,
  );

  static const messageText = TextStyle(
    fontFamily: _serif,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoal,
    height: 1.8,
    letterSpacing: 0.3,
  );

  static const footerName = TextStyle(
    fontFamily: _serif,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.charcoal,
    letterSpacing: 2.0,
  );
}

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.warmCream,
        colorScheme: const ColorScheme.light(
          primary: AppColors.gold,
          secondary: AppColors.deepRose,
          surface: AppColors.warmCream,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.charcoal,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gold,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            textStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0,
            ),
          ),
        ),
      );
}
