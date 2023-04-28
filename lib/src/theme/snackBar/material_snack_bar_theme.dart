import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class MaterialSnackBarTheme extends SnackBarOverlayTheme {
  MaterialSnackBarTheme({
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff3c3b39),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    List<BoxShadow>? boxShadow,
  }) : super(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );
}
