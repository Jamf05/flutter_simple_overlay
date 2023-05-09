import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class MaterialNotificationTheme extends NotificationOverlayTheme {
  MaterialNotificationTheme({
    super.icon = const Icon(
      Icons.notifications_active_outlined,
      color: Color(0xff212121),
      size: 18,
    ),
    super.widthFactor = 0.975,
    super.duration = const Duration(milliseconds: 2500),
    super.animationDuration,
    super.removeDuration,
    super.background = Colors.white,
    super.titleTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    super.padding,
    super.margin,
    super.onTap,
    super.titleTextMaxLines,
    super.titleTextOverflow,
    super.bodyTextMaxLines,
    super.bodyTextOverflow,
    super.borderWidth,
    super.borderRadius,
    super.filter,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );

  MaterialNotificationTheme.reload({
    super.icon = const Icon(
      Icons.replay,
      color: Colors.white,
      size: 18,
    ),
    super.widthFactor = 0.975,
    super.duration = const Duration(milliseconds: 2500),
    super.animationDuration,
    super.removeDuration,
    super.background = const Color(0xff5f7c8a),
    super.titleTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );

  MaterialNotificationTheme.success({
    super.icon = const Icon(
      Icons.check,
      color: Colors.white,
      size: 18,
    ),
    super.widthFactor = 0.975,
    super.duration = const Duration(milliseconds: 2500),
    super.animationDuration,
    super.removeDuration,
    super.background = const Color(0xff4cb050),
    super.titleTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );

  MaterialNotificationTheme.stop({
    super.icon = const Icon(
      Icons.back_hand,
      color: Colors.white,
      size: 18,
    ),
    super.widthFactor = 0.975,
    super.duration = const Duration(milliseconds: 2500),
    super.animationDuration,
    super.removeDuration,
    super.background = const Color(0xffff9700),
    super.titleTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );

  MaterialNotificationTheme.error({
    super.icon = const Icon(
      Icons.close,
      color: Colors.white,
      size: 18,
    ),
    super.widthFactor = 0.975,
    super.duration = const Duration(milliseconds: 2500),
    super.animationDuration,
    super.removeDuration,
    super.background = const Color(0xfff44236),
    super.titleTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );

  MaterialNotificationTheme.warning({
    super.icon = const Icon(
      Icons.warning_amber_rounded,
      color: Colors.white,
      size: 18,
    ),
    super.widthFactor = 0.975,
    super.duration = const Duration(milliseconds: 2500),
    super.animationDuration,
    super.removeDuration,
    super.background = const Color(0xff3f51b5),
    super.titleTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );

  @override
  NotificationOverlayTheme copyWith(
      {Widget? icon,
      double? widthFactor,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      Duration? duration,
      Duration? animationDuration,
      Duration? removeDuration,
      void Function()? onTap,
      Color? background,
      TextStyle? titleTextStyle,
      int? titleTextMaxLines,
      TextOverflow? titleTextOverflow,
      TextStyle? bodyTextStyle,
      int? bodyTextMaxLines,
      TextOverflow? bodyTextOverflow,
      Color? borderColor,
      double? borderWidth,
      BorderRadiusGeometry? borderRadius,
      List<BoxShadow>? boxShadow,
      ImageFilter? filter}) {
        return MaterialNotificationTheme(
          icon: icon ?? this.icon,
          widthFactor: widthFactor ?? this.widthFactor,
          padding: padding ?? this.padding,
          margin: margin ?? this.margin,
          duration: duration ?? this.duration,
          animationDuration: animationDuration ?? this.animationDuration,
          removeDuration: removeDuration ?? this.removeDuration,
          onTap: onTap ?? this.onTap,
          background: background ?? this.background,
          titleTextStyle: titleTextStyle ?? this.titleTextStyle,
          titleTextMaxLines: titleTextMaxLines ?? this.titleTextMaxLines,
          titleTextOverflow: titleTextOverflow ?? this.titleTextOverflow,
          bodyTextStyle: bodyTextStyle ?? this.bodyTextStyle,
          bodyTextMaxLines: bodyTextMaxLines ?? this.bodyTextMaxLines,
          bodyTextOverflow: bodyTextOverflow ?? this.bodyTextOverflow,
          borderColor: borderColor ?? this.borderColor,
          borderWidth: borderWidth ?? this.borderWidth,
          borderRadius: borderRadius ?? this.borderRadius,
          boxShadow: boxShadow ?? this.boxShadow,
          filter: filter ?? this.filter,
        );
      }
}
