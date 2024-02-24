import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff005e23, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff005e23), //10%
      100: Color(0xff005520), //20%
      200: Color(0xff004b1c), //30%
      300: Color(0xff004219), //40%
      400: Color(0xff003815), //50%
      500: Color(0xff002f12), //60%
      600: Color(0xff00260e), //70%
      700: Color(0xff001c0a), //80%
      800: Color(0xff000903), //90%
      900: Color(0xff000000), //100%
    },
  );
}
