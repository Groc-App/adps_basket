/* -------------------------------------------------------------------------- */
/*                                 Theme Data                                 */
/* -------------------------------------------------------------------------- */
import 'package:flutter/material.dart';

class MyTheme {
/* ------------------------------- light theme ------------------------------ */
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.purple,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 251, 250, 250)),
        textTheme: Theme.of(context).textTheme,
      ));
}
