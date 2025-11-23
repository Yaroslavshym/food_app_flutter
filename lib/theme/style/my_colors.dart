import 'package:flutter/material.dart';

Color white = const Color.fromRGBO(255, 255, 255, 1);
Color black = const Color.fromRGBO(0, 0, 0, 1);
Color orange = const Color.fromRGBO(254, 140, 0, 1);
Color grey50 = const Color.fromRGBO(194, 194, 194, 1);
Color black100 = const Color.fromRGBO(15, 15, 15, 1);
Color white100 = const Color.fromRGBO(240, 240, 240, 1);
Color grey60 = const Color.fromRGBO(135, 135, 135, 1);
Color grey40 = const Color.fromRGBO(214, 214, 214, 1);
Color error = const Color.fromRGBO(241, 65, 65, 1);
Color grey10 = Colors.white10;

class CoreColors {
  // TODO: move to app bloc
  static bool darkTheme = false;
}

enum MyColors { white, orange, grey50, black100, grey60, grey40, error, black, grey10}

extension MyColorValues on MyColors {
  Color get color {
    switch (this) {
      case MyColors.grey10:
        return CoreColors.darkTheme ? grey10:Colors.white;
      case MyColors.white:
        return CoreColors.darkTheme ? black : white;
      case MyColors.black:
        return CoreColors.darkTheme ? white : black;
      case MyColors.orange:
        return orange;
      case MyColors.grey50:
        return grey50;
      case MyColors.black100:
        return CoreColors.darkTheme ? white100 : black100;
      case MyColors.grey60:
        return CoreColors.darkTheme ? grey40 : grey60;
      case MyColors.grey40:
        return CoreColors.darkTheme ? grey60 : grey40;
      case MyColors.error:
        return error;
    }
  }
}
