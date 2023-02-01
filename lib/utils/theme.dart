/* -------------------------------------------------------------------------- */
/*                                 Theme Data                                 */
/* -------------------------------------------------------------------------- */
import 'package:flutter/material.dart';

class MyTheme {
/* ------------------------------- light theme ------------------------------ */
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 251, 250, 250)),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
        primaryColor: Colors.deepPurple[300],
        backgroundColor: Color.fromARGB(245, 246, 251, 255),
      );
}
