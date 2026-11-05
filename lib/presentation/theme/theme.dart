import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volta/presentation/theme/colors.dart';

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
  displayLarge: GoogleFonts.googleSansFlex(),
  displayMedium: GoogleFonts.googleSansFlex(),
  displaySmall: GoogleFonts.googleSansFlex(),
  titleLarge: GoogleFonts.googleSansFlex(),
  titleMedium: GoogleFonts.googleSansFlex(),
  titleSmall: GoogleFonts.googleSansFlex(),
  bodyLarge: GoogleFonts.inter(),
  bodyMedium: GoogleFonts.inter(),
  bodySmall: GoogleFonts.inter(),
  labelLarge: GoogleFonts.inter(),
  labelMedium: GoogleFonts.inter(),
  labelSmall: GoogleFonts.inter(),
);

final defaultTheme = ThemeData(
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: .fromARGB(0, 0, 0, 0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);

final lightTheme = defaultTheme.copyWith(
  colorScheme: lightColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: .fromARGB(0, 0, 0, 0),
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      textStyle: textTheme.labelLarge!.copyWith(fontWeight: .bold),
    ),
  ),
);

final darkTheme = defaultTheme.copyWith(colorScheme: darkColorScheme);
