// ignore_for_file: prefer_const_constructors

/* -------------------------------------------------------------------------- */
/*                                 Theme Data                                 */
/* -------------------------------------------------------------------------- */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
/* ------------------------------- light theme ------------------------------ */
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textTheme: TextTheme(
          labelLarge: GoogleFonts.montserrat(),
          labelMedium: GoogleFonts.montserrat(),
          labelSmall: GoogleFonts.montserrat(),
          bodyLarge: GoogleFonts.montserrat(),
          bodyMedium: GoogleFonts.montserrat(),
          bodySmall: GoogleFonts.montserrat(),
          titleLarge: GoogleFonts.montserrat(),
          titleMedium: GoogleFonts.montserrat(),
          titleSmall: GoogleFonts.montserrat(),
          displayLarge: GoogleFonts.montserrat(),
          displayMedium: GoogleFonts.montserrat(),
          displaySmall: GoogleFonts.montserrat(),
          headlineLarge: GoogleFonts.montserrat(),
          headlineMedium: GoogleFonts.montserrat(),
          headlineSmall: GoogleFonts.montserrat(),
        ),

        /* ------------------------------ APP BAR THEME ----------------------------- */
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            foregroundColor: const Color.fromRGBO(83, 177, 117, 1),
            elevation: 1.0,
            iconTheme:
                const IconThemeData(color: Color.fromRGBO(83, 177, 117, 1)),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(83, 177, 117, 1),
                fontSize: 20)),

        /* --------------------------------- COLORS --------------------------------- */
        primaryColor: const Color.fromRGBO(83, 177, 117, 1),
        highlightColor: Colors.white,
        dividerColor: const Color.fromRGBO(214, 204, 194, 1),

        /* ------------------------------ BUTTON THEME ------------------------------ */
        buttonTheme: const ButtonThemeData(
            buttonColor: Color.fromRGBO(83, 177, 117, 1),
            hoverColor: Color.fromRGBO(227, 213, 202, 1)),
        // cardColor: Color.fromRGBO(245, 235, 224, 1),

        /* -------------------------- OUTLINED BUTTON THEME ------------------------- */

        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                // backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                backgroundColor: Colors.green[400],
                foregroundColor: Colors.white)),

        /* ------------------------------- CARD THEME ------------------------------- */
        cardTheme: CardTheme(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),

        scaffoldBackgroundColor: Colors.white,
        // scaffoldBackgroundColor: Color.fromRGBO(243, 243, 243, 1),

        bottomNavigationBarTheme: (const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color.fromRGBO(83, 177, 117, 1))),
      );
}
