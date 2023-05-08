import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class MaterialToastTheme extends ToastOverlayTheme {
  MaterialToastTheme(
      {super.icon,
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.background = const Color(0xff3c3b39),
      super.textStyle =
          const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      super.textMaxLines,
      super.textoverflow,
      super.reverseDuration,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  MaterialToastTheme.reload(
      {super.icon = const Icon(
        Icons.replay,
        color: Colors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.background = const Color(0xff5f7c8a),
      super.textStyle =
          const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      super.textMaxLines,
      super.textoverflow,
      super.reverseDuration,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  MaterialToastTheme.success(
      {super.icon = const Icon(
        Icons.check,
        color: Colors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.background = const Color(0xff4cb050),
      super.textStyle =
          const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      super.textMaxLines,
      super.textoverflow,
      super.reverseDuration,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  MaterialToastTheme.stop(
      {super.icon = const Icon(
        Icons.back_hand,
        color: Colors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.background = const Color(0xffff9700),
      super.textStyle =
          const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      super.textMaxLines,
      super.textoverflow,
      super.reverseDuration,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  MaterialToastTheme.error(
      {super.icon = const Icon(
        Icons.close,
        color: Colors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.background = const Color(0xfff44236),
      super.textStyle =
          const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      super.textMaxLines,
      super.textoverflow,
      super.reverseDuration,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  MaterialToastTheme.warning(
      {super.icon = const Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.background = const Color(0xff3f51b5),
      super.textStyle =
          const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      super.textMaxLines,
      super.textoverflow,
      super.reverseDuration,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  @override
  ToastOverlayTheme copyWith(
      {Widget? icon,
      double? widthFactor,
      BoxConstraints? constraints,
      Color? background,
      TextStyle? textStyle,
      int? textMaxLines,
      TextOverflow? textoverflow,
      Duration? duration,
      Duration? reverseDuration,
      BorderRadiusGeometry? borderRadius}) {
    return MaterialToastTheme(
      icon: icon ?? this.icon,
      widthFactor: widthFactor ?? this.widthFactor,
      constraints: constraints ?? this.constraints,
      background: background ?? this.background,
      textStyle: textStyle ?? this.textStyle,
      textMaxLines: textMaxLines ?? this.textMaxLines,
      textoverflow: textoverflow ?? this.textoverflow,
      duration: duration ?? this.duration,
      reverseDuration: reverseDuration ?? this.reverseDuration,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
