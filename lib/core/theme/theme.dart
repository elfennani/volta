import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volta/core/constants/colors.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: primaryLight,
  brightness: .light,
  primary: primaryLight,
  onPrimary: onPrimaryLight,
  surface: backgroundLight,
  onSurface: onBackgroundLight,
  surfaceContainer: surfaceLight,
  onSurfaceVariant: onSurfaceLight,
  outline: outlineLight,
  primaryContainer: primaryContainerLight,
  onPrimaryContainer: onPrimaryContainerLight,
);

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: primaryDark,
  brightness: .dark,
  primary: primaryDark,
  onPrimary: onPrimaryDark,
  surface: backgroundDark,
  onSurface: onBackgroundDark,
  surfaceContainer: surfaceDark,
  onSurfaceVariant: onSurfaceDark,
  outline: outlineDark,
  primaryContainer: primaryContainerDark,
  onPrimaryContainer: onPrimaryContainerDark,
);

final textTheme = TextTheme(
  displayLarge: GoogleFonts.googleSansCode(),
  displayMedium: GoogleFonts.googleSansCode(),
  displaySmall: GoogleFonts.googleSansCode(),
  titleLarge: GoogleFonts.googleSansCode(),
  titleMedium: GoogleFonts.googleSansCode(),
  titleSmall: GoogleFonts.googleSansCode(),
  bodyLarge: GoogleFonts.googleSansCode(),
  bodyMedium: GoogleFonts.googleSansCode(),
  bodySmall: GoogleFonts.googleSansCode(),
  labelLarge: GoogleFonts.googleSansCode(),
  labelMedium: GoogleFonts.googleSansCode(),
  labelSmall: GoogleFonts.googleSansCode(),
);

final defaultTheme = ThemeData(
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  ),
);

final lightTheme = defaultTheme.copyWith(colorScheme: lightColorScheme);

final darkTheme = defaultTheme.copyWith(colorScheme: darkColorScheme);
