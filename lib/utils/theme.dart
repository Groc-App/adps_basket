/* -------------------------------------------------------------------------- */
/*                                 Theme Data                                 */
/* -------------------------------------------------------------------------- */
import 'package:flutter/material.dart';

class MyTheme {
/* ------------------------------- light theme ------------------------------ */
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 251, 250, 250)),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),

        primaryColor: const Color.fromRGBO(227, 213, 202, 1),
        dividerColor: const Color.fromRGBO(214, 204, 194, 1),

        buttonTheme: const ButtonThemeData(
            buttonColor: Color.fromRGBO(214, 204, 194, 1),
            hoverColor: Color.fromRGBO(227, 213, 202, 1)),
        // cardColor: Color.fromRGBO(245, 235, 224, 1),

        cardTheme: const CardTheme(color: Color.fromRGBO(245, 235, 224, 1)),

        backgroundColor: const Color.fromRGBO(237, 237, 233, 1),
        bottomAppBarColor: const Color.fromRGBO(213, 189, 175, 1),
      );
}
