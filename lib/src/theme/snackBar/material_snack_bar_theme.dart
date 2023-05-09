import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class MaterialSnackBarTheme extends SnackBarOverlayTheme {
  MaterialSnackBarTheme({
    super.widthFactor = 0.85,
    super.duration = const Duration(milliseconds: 2500),
    super.animationDuration,
    super.removeDuration = const Duration(seconds: 3000),
    super.background = const Color(0xff3c3b39),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.padding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
    super.margin,
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

  @override
  SnackBarOverlayTheme copyWith(
      {double? widthFactor,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      Color? background,
      TextStyle? textStyle,
      int? textMaxLines,
      TextOverflow? textOverflow,
      ButtonStyle? styleActionButton,
      String? textActionButton,
      double? heightActionButton,
      Duration? duration,
      Duration? animationDuration,
      Duration? removeDuration,
      BorderRadiusGeometry? borderRadius,
      List<BoxShadow>? boxShadow}) {
    return MaterialSnackBarTheme(
      widthFactor: widthFactor ?? this.widthFactor,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      background: background ?? this.background,
      textStyle: textStyle ?? this.textStyle,
      textMaxLines: textMaxLines ?? this.textMaxLines,
      textOverflow: textOverflow ?? this.textOverflow,
      styleActionButton: styleActionButton ?? this.styleActionButton,
      textActionButton: textActionButton ?? this.textActionButton,
      heightActionButton: heightActionButton ?? this.heightActionButton,
      duration: duration ?? this.duration,
      animationDuration: animationDuration ?? this.animationDuration,
      removeDuration: removeDuration ?? this.removeDuration,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
    );
  }
}
