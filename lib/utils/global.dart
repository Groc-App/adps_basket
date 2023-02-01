// class GlobalVar{
//   static scWidth=
// }
// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class Globals {
  late final screenSize;
  late BuildContext context;
  void setContext(cntx) {
    // context = cntx;
    screenSize = MediaQuery.of(cntx).size;
  }

  late final screen_width = screenSize.width;
  late final screen_height = screenSize.height;
}
