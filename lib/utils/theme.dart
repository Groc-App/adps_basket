// ignore_for_file: prefer_const_constructors

/* -------------------------------------------------------------------------- */
/*                                 Theme Data                                 */
/* -------------------------------------------------------------------------- */
import 'package:flutter/material.dart';

class MyTheme {
/* ------------------------------- light theme ------------------------------ */
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        /* ------------------------------ APP BAR THEME ----------------------------- */
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          foregroundColor: const Color.fromRGBO(83, 177, 117, 1),
          // color: Color.fromRGBO(83, 177, 117, 1),
          elevation: 0.0,
          iconTheme:
              const IconThemeData(color: Color.fromRGBO(83, 177, 117, 1)),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),

        /* --------------------------------- COLORS --------------------------------- */
        primaryColor: Colors.white,
        dividerColor: const Color.fromRGBO(214, 204, 194, 1),

        /* ------------------------------ BUTTON THEME ------------------------------ */
        buttonTheme: const ButtonThemeData(
            buttonColor: Color.fromRGBO(83, 177, 117, 1),
            hoverColor: Color.fromRGBO(227, 213, 202, 1)),
        // cardColor: Color.fromRGBO(245, 235, 224, 1),

        /* -------------------------- OUTLINED BUTTON THEME ------------------------- */

        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                foregroundColor: Colors.white)),

        /* ------------------------------- CARD THEME ------------------------------- */
        cardTheme: CardTheme(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        // scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        scaffoldBackgroundColor: Colors.white,
        // backgroundColor: const Color.fromRGBO(237, 237, 233, 1),
        // bottomAppBarTheme:
        // BottomAppBarTheme(color: const Color.fromRGBO(213, 189, 175, 1)),
        bottomNavigationBarTheme: (const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color.fromRGBO(83, 177, 117, 1))),
      );
}
