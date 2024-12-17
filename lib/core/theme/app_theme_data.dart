import 'package:flutter/material.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class AppThemeData {
  static final ThemeData light = ThemeData(
    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.gray100,
      primaryContainer: AppColors.offWhite,
      secondaryContainer: AppColors.gray100,
      shadow: AppColors.gray300,
      outline: AppColors.gray200,
      error: AppColors.error,
      inversePrimary: AppColors.white,
    ),

    // Text Color
    textTheme: textTheme.copyWith(),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
    ),
  );

  static final ThemeData dark = ThemeData(
    // Color Scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      surface: AppColors.black,
      primaryContainer: AppColors.gray400,
      secondaryContainer: AppColors.gray200,
      shadow: AppColors.gray200,
      outline: AppColors.gray100,
      error: AppColors.errorDark,
      inversePrimary: AppColors.black,
    ),

    // Text Color
    textTheme: textTheme.copyWith(
      displayLarge: textTheme.displayLarge?.copyWith(color: AppColors.white),
      displayMedium: textTheme.displayMedium?.copyWith(color: AppColors.white),
      displaySmall: textTheme.displaySmall?.copyWith(color: AppColors.white),
      titleLarge: textTheme.titleLarge?.copyWith(color: AppColors.white),
      titleMedium: textTheme.titleMedium?.copyWith(color: AppColors.white),
      titleSmall: textTheme.titleSmall?.copyWith(color: AppColors.white),
      bodyLarge: textTheme.bodyLarge?.copyWith(color: AppColors.white),
      bodyMedium: textTheme.bodyMedium?.copyWith(color: AppColors.white),
      bodySmall: textTheme.bodySmall?.copyWith(color: AppColors.white),
      labelLarge: textTheme.labelLarge?.copyWith(color: AppColors.white),
      labelMedium: textTheme.labelMedium?.copyWith(color: AppColors.white),
      labelSmall: textTheme.labelSmall?.copyWith(color: AppColors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.offWhite,
    ),
  );

  static const TextTheme textTheme = TextTheme(
    /**
     * 헤딩
     */
    // 앱에서 가장 큰 헤딩. 홈 화면 제목이나 주요 섹션 제목에 사용.
    displayLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    // 큰 헤딩
    displayMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    // 부제목
    displaySmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),

    /**
     * 타이틀 (제목)
     */
    // 일반 페이지 제목, 주요 타이틀
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    // 카드 제목, 세션 제목 등
    titleMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    // 카드 제목 세션 제목 등
    titleSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),

    /**
     * 본문 텍스트
     */
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),

    /**
     * 버튼 또는 라벨
     */
    labelLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
  );
}
