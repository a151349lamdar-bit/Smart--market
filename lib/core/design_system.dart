// سیستم طراحی یکپارچه و مشتری‌پسند

import 'package:flutter/material.dart';

class DesignSystem {
  // رنگ‌های اصلی برند
  static const Color primaryColor = Color(0xFF4CAF50); // سبز بازار
  static const Color secondaryColor = Color(0xFF2196F3); // آبی
  static const Color accentColor = Color(0xFFFF9800); // نارنجی
  static const Color successColor = Color(0xFF4CAF50); // سبز
  static const Color errorColor = Color(0xFFF44336); // قرمز
  static const Color warningColor = Color(0xFFFFC107); // زرد
  static const Color infoColor = Color(0xFF2196F3); // آبی اطلاعات
  
  // رنگ‌های متن
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFF9E9E9E);
  
  // رنگ‌های پس‌زمینه
  static const Color backgroundPrimary = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);
  
  // سایه‌ها (Elevation)
  static List<BoxShadow> getShadow(int level) {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.1 * level),
        blurRadius: 4.0 * level,
        offset: Offset(0, 2.0 * level),
      ),
    ];
  }
  
  // تایپوگرافی
  static TextStyle get headline1 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 96.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  
  static TextStyle get headline2 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 60.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );
  
  static TextStyle get headline3 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
  );
  
  static TextStyle get headline4 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 34.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  
  static TextStyle get headline5 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
  );
  
  static TextStyle get headline6 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  
  static TextStyle get subtitle1 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  
  static TextStyle get subtitle2 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  
  static TextStyle get bodyText1 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  
  static TextStyle get bodyText2 => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  
  static TextStyle get button => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );
  
  static TextStyle get caption => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
  
  static TextStyle get overline => const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
  
  // Spacing System (8px grid)
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  
  // Border Radius
  static const double borderRadiusXS = 4.0;
  static const double borderRadiusS = 8.0;
  static const double borderRadiusM = 12.0;
  static const double borderRadiusL = 16.0;
  static const double borderRadiusXL = 24.0;
  static const double borderRadiusCircle = 100.0;
  
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  
  // Breakpoints (Responsive Design)
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double desktopBreakpoint = 1200.0;
  
  // Icons
  static const double iconSizeXS = 16.0;
  static const double iconSizeS = 20.0;
  static const double iconSizeM = 24.0;
  static const double iconSizeL = 32.0;
  static const double iconSizeXL = 48.0;
  
  // App Bar
  static const double appBarHeight = 56.0;
  static const double appBarElevation = 4.0;
  
  // Buttons
  static const double buttonHeight = 48.0;
  static const double buttonMinWidth = 88.0;
  static const double buttonBorderRadius = 8.0;
  
  // Input Fields
  static const double inputHeight = 56.0;
  static const double inputBorderWidth = 1.0;
  static const double inputBorderRadius = 8.0;
  
  // Cards
  static const double cardElevation = 2.0;
  static const double cardBorderRadius = 12.0;
  
  // Dialogs
  static const double dialogElevation = 24.0;
  static const double dialogBorderRadius = 16.0;
  
  // ایجاد ThemeData کامل
  static ThemeData get lightTheme => ThemeData(
    primaryColor: primaryColor,
    primarySwatch: MaterialColor(primaryColor.value, {
      50: primaryColor.withOpacity(0.1),
      100: primaryColor.withOpacity(0.2),
      200: primaryColor.withOpacity(0.3),
      300: primaryColor.withOpacity(0.4),
      400: primaryColor.withOpacity(0.5),
      500: primaryColor.withOpacity(0.6),
      600: primaryColor.withOpacity(0.7),
      700: primaryColor.withOpacity(0.8),
      800: primaryColor.withOpacity(0.9),
      900: primaryColor,
    }),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: backgroundPrimary,
      background: backgroundPrimary,
      error: errorColor,
    ),
    fontFamily: 'Vazir',
    textTheme: TextTheme(
      displayLarge: headline1,
      displayMedium: headline2,
      displaySmall: headline3,
      headlineMedium: headline4,
      headlineSmall: headline5,
      titleLarge: headline6,
      titleMedium: subtitle1,
      titleSmall: subtitle2,
      bodyLarge: bodyText1,
      bodyMedium: bodyText2,
      labelLarge: button,
      bodySmall: caption,
      labelSmall: overline,
    ),
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: appBarElevation,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Vazir',
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      height: buttonHeight,
      minWidth: buttonMinWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(buttonBorderRadius)),
      ),
    ),
    cardTheme: CardTheme(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    dialogTheme: DialogTheme(
      elevation: dialogElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogBorderRadius),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputBorderRadius),
        borderSide: const BorderSide(color: textDisabled),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputBorderRadius),
        borderSide: const BorderSide(color: textDisabled),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputBorderRadius),
        borderSide: const BorderSide(color: primaryColor),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spacingM,
        vertical: spacingS,
      ),
    ),
  );
  
  static ThemeData get darkTheme => ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: backgroundDark,
      background: backgroundDark,
      error: errorColor,
    ),
    fontFamily: 'Vazir',
    // ... ادامه تنظیمات تم تاریک
  );
  
  // کامپوننت‌های از پیش ساخته شده
  static InputDecoration textFieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputBorderRadius),
      ),
    );
  }
  
  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: backgroundPrimary,
      borderRadius: BorderRadius.circular(cardBorderRadius),
      boxShadow: getShadow(1),
    );
  }
  
  static BoxDecoration elevatedButtonDecoration() {
    return BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(buttonBorderRadius),
      boxShadow: getShadow(2),
    );
  }
  
  // Utility Methods
  static bool isMobile(double width) => width < mobileBreakpoint;
  static bool isTablet(double width) => 
      width >= mobileBreakpoint && width < tabletBreakpoint;
  static bool isDesktop(double width) => width >= desktopBreakpoint;
}
