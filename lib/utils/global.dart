// class GlobalVar{
//   static scWidth=
// }
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
