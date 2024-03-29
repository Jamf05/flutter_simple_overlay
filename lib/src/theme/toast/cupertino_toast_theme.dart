import 'package:flutter/cupertino.dart';
import 'package:simple_overlay/simple_overlay.dart';

class CupertinoToastTheme extends ToastOverlayTheme {
  CupertinoToastTheme(
      {super.icon,
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.animationDuration,
      super.removeDuration,
      super.background = const Color(0xff3c3b39),
      super.textStyle = const TextStyle(
          color: CupertinoColors.white, fontFamily: '.SF UI Text'),
      super.textMaxLines,
      super.textoverflow,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  CupertinoToastTheme.reload(
      {super.icon = const Icon(
        CupertinoIcons.gobackward,
        color: CupertinoColors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.animationDuration,
      super.removeDuration,
      super.background = const Color(0xff5f7c8a),
      super.textStyle = const TextStyle(
          color: CupertinoColors.white, fontFamily: '.SF UI Text'),
      super.textMaxLines,
      super.textoverflow,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  CupertinoToastTheme.success(
      {super.icon = const Icon(
        CupertinoIcons.check_mark_circled,
        color: CupertinoColors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.animationDuration,
      super.removeDuration,
      super.background = const Color(0xff4cb050),
      super.textStyle = const TextStyle(
          color: CupertinoColors.white, fontFamily: '.SF UI Text'),
      super.textMaxLines,
      super.textoverflow,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  CupertinoToastTheme.stop(
      {super.icon = const Icon(
        CupertinoIcons.hand_raised_fill,
        color: CupertinoColors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.animationDuration,
      super.removeDuration,
      super.background = const Color(0xffff9700),
      super.textStyle = const TextStyle(
          color: CupertinoColors.white, fontFamily: '.SF UI Text'),
      super.textMaxLines,
      super.textoverflow,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  CupertinoToastTheme.error(
      {super.icon = const Icon(
        CupertinoIcons.clear_circled,
        color: CupertinoColors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.animationDuration,
      super.removeDuration,
      super.background = const Color(0xfff44236),
      super.textStyle = const TextStyle(
          color: CupertinoColors.white, fontFamily: '.SF UI Text'),
      super.textMaxLines,
      super.textoverflow,
      BorderRadiusGeometry? borderRadius})
      : super(borderRadius: borderRadius ?? BorderRadius.circular(40));

  CupertinoToastTheme.warning(
      {super.icon = const Icon(
        CupertinoIcons.exclamationmark_circle,
        color: CupertinoColors.white,
      ),
      super.widthFactor = 1,
      super.constraints,
      super.duration = const Duration(milliseconds: 2500),
      super.animationDuration,
      super.removeDuration,
      super.background = const Color(0xff3f51b5),
      super.textStyle = const TextStyle(
          color: CupertinoColors.white, fontFamily: '.SF UI Text'),
      super.textMaxLines,
      super.textoverflow,
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
      Duration? animationDuration,
      Duration? removeDuration,
      BorderRadiusGeometry? borderRadius}) {
    return CupertinoToastTheme(
      icon: icon ?? this.icon,
      widthFactor: widthFactor ?? this.widthFactor,
      constraints: constraints ?? this.constraints,
      background: background ?? this.background,
      textStyle: textStyle ?? this.textStyle,
      textMaxLines: textMaxLines ?? this.textMaxLines,
      textoverflow: textoverflow ?? this.textoverflow,
      duration: duration ?? this.duration,
      animationDuration: animationDuration ?? this.animationDuration,
      removeDuration: removeDuration ?? this.removeDuration,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
