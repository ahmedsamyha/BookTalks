import 'package:flutter/material.dart';

class AppTextTheme {
  static TextStyle? splashTitle = const TextStyle(
      fontFamily: 'Playball', fontSize: 16, fontWeight: FontWeight.bold);
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        fontFamily: 'Poppins',
        color: Colors.black),
    headlineMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        fontFamily: 'Poppins',
        color: Colors.black),
    bodyMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Poppins',
        color: Colors.black),
    bodySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: 'Poppins',
        color: Colors.black),
    titleSmall: const TextStyle().copyWith(
        color: Colors.black.withOpacity(.4),
        fontFamily: 'Playball',
        fontSize: 16,
        fontWeight: FontWeight.bold),
    labelSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: 'Poppins',
        color: Colors.black),
    headlineSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        fontFamily: 'Poppins',
        color: Colors.black),
    displaySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: 'Poppins',
        color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        fontFamily: 'Poppins',
        color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        fontFamily: 'Poppins',
        color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'Poppins',
        color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: 'Poppins',
        color: Colors.white),
    labelSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: 'Poppins',
        color: Colors.white),
    // Splash Screen Bottom Text
    titleSmall: const TextStyle().copyWith(
        color: Colors.grey,
        fontFamily: 'Playball',
        fontSize: 16,
        fontWeight: FontWeight.bold),
    headlineSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        fontFamily: 'Poppins',
        color: Colors.white),
    displaySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: 'Poppins',
        color: Colors.white),
  );
}
