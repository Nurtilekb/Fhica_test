import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Центральное хранилище всех стилей и констант приложения
class AppTheme {
  AppTheme._();

  // Цветовая палитра
  static const Color primaryColor = Color(0xFF00a5df);
  static const Color primaryLight = Color(0xFFEDFAFF);
  static const Color textDark = Color(0xFF07242F);
  static const Color textBlack = Color(0xFF000000);
  static const Color backgroundGray = Color(0xffE9E9E9);
  static const Color disabledGray = Color(0xFFC4C4C4);
  static const Color overlayGreen = Color.fromARGB(20, 36, 47, 13);
  static const Color overlayWhite = Color.fromARGB(59, 255, 255, 255);
  
  // Градиенты
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, Color(0xFF0088cc)],
  );

  // Типографика
  static String get fontFamily => 'interTight';

  static TextStyle headingLarge({Color color = textDark}) => TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle headingMedium({Color color = textDark}) => TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headingSmall({Color color = textDark}) => TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyLarge({Color color = textBlack}) => TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyMedium({Color color = textBlack}) => TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle buttonLabel({Color color = primaryLight}) => TextStyle(
    fontFamily: fontFamily,
    color: color,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  // Размеры и отступы
  static double get buttonHeight => 56.h;
  static double get buttonWidth => 343.w;
  static double get buttonRadius => 32.r;
  static double get cardRadius => 12.r;
  static double get smallRadius => 8.r;
  static double get chipRadius => 16.r;
  
  static EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get cardMargin => EdgeInsets.symmetric(vertical: 8.h);
  
  // Анимации
  static Duration get animationDuration => const Duration(milliseconds: 300);
  static Curve get animationCurve => Curves.easeInOut;

  // Тени
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get activeShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
}
