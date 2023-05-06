import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class MaterialSnackBarTheme extends SnackBarOverlayTheme {
  MaterialSnackBarTheme({
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff3c3b39),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.padding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
    super.margin,
    super.reverseDuration = const Duration(seconds: 8),
    super.textMaxLines = 2,
    super.textOverflow = TextOverflow.ellipsis,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    super.textActionButton = "Action",
    super.heightActionButton = 20.0,
    super.styleActionButton,
  }) : super(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );
}
