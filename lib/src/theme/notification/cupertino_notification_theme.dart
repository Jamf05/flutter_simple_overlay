import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';
import 'package:simple_overlay/src/widgets/round_icon_with_blurred_background.dart';

class CupertinoNotificationTheme extends NotificationOverlayTheme {
  CupertinoNotificationTheme({
    Widget? icon,
    Color? background,
    super.duration = const Duration(milliseconds: 2500),
    super.titleTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    ImageFilter? filter,
  }) : super(
            background: background ?? Colors.white.withOpacity(0.5),
            boxShadow: boxShadow ??
                <BoxShadow>[
                  BoxShadow(
                      blurRadius: 6,
                      color: CupertinoColors.black.withOpacity(0.15))
                ],
            filter: filter ?? ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            borderRadius: borderRadius ?? BorderRadius.circular(16.0),
            icon: RoundIconWithBlurredBackground(
              background: Colors.black,
              child: icon ??
                  const Icon(
                    CupertinoIcons.bell_circle_fill,
                    color: Color(0xff212121),
                    size: 25,
                  ),
            ));

  CupertinoNotificationTheme.reload({
    Widget? icon,
    super.duration = const Duration(milliseconds: 2500),
    Color? background,
    super.titleTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    ImageFilter? filter,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          background: background ?? Colors.white.withOpacity(0.5),
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          boxShadow: boxShadow ??
              <BoxShadow>[
                BoxShadow(
                    blurRadius: 6,
                    color: CupertinoColors.black.withOpacity(0.15))
              ],
          filter: filter ?? ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          icon: RoundIconWithBlurredBackground(
            background: const Color(0xff212121),
            child: icon ??
                const Icon(
                  CupertinoIcons.gobackward,
                  color: Color(0xff212121),
                  size: 25,
                ),
          ),
        );

  CupertinoNotificationTheme.success({
    Widget? icon,
    super.duration = const Duration(milliseconds: 2500),
    Color? background,
    super.titleTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    ImageFilter? filter,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          background: background ?? Colors.white.withOpacity(0.5),
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          boxShadow: boxShadow ??
              <BoxShadow>[
                BoxShadow(
                    blurRadius: 6,
                    color: CupertinoColors.black.withOpacity(0.15))
              ],
          filter: filter ?? ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          icon: RoundIconWithBlurredBackground(
            background: const Color.fromARGB(255, 0, 105, 4),
            child: icon ?? const Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              color: Color(0xff4cb050),
              size: 25,
            ),
          ),
        );

  CupertinoNotificationTheme.stop({
    Widget? icon,
    super.duration = const Duration(milliseconds: 2500),
    Color? background,
    super.titleTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    ImageFilter? filter,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          background: background ?? Colors.white.withOpacity(0.5),
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          boxShadow: boxShadow ??
              <BoxShadow>[
                BoxShadow(
                    blurRadius: 6,
                    color: CupertinoColors.black.withOpacity(0.15))
              ],
          filter: filter ?? ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          icon: RoundIconWithBlurredBackground(
            background: const Color(0xff212121),
            child: icon ?? const Icon(
              CupertinoIcons.hand_raised_fill,
              color: Color(0xff212121),
              size: 25,
            ),
          ),
        );

  CupertinoNotificationTheme.error({
    Widget? icon,
    super.duration = const Duration(milliseconds: 2500),
    Color? background,
    super.titleTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    ImageFilter? filter,
    BorderRadiusGeometry? borderRadius,
  }) : super(
            background: background ?? Colors.white.withOpacity(0.5),
            borderRadius: borderRadius ?? BorderRadius.circular(16.0),
            boxShadow: boxShadow ??
                <BoxShadow>[
                  BoxShadow(
                      blurRadius: 6,
                      color: CupertinoColors.black.withOpacity(0.15))
                ],
            filter: filter ?? ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            icon: RoundIconWithBlurredBackground(
              background: const Color(0xfff44236),
              child: icon ??
                  const Icon(
                    CupertinoIcons.clear_circled,
                    color: Color(0xfff44236),
                    size: 25,
                  ),
            ));

  CupertinoNotificationTheme.warning({
    Widget? icon,
    super.duration = const Duration(milliseconds: 2500),
    Color? background,
    super.titleTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w500,
        fontSize: 14),
    super.bodyTextStyle = const TextStyle(
        color: Color(0xff212121),
        fontFamily: '.SF UI Text',
        fontWeight: FontWeight.w400,
        fontSize: 14),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    ImageFilter? filter,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          background: background ?? Colors.white.withOpacity(0.5),
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          boxShadow: boxShadow ??
              <BoxShadow>[
                BoxShadow(
                    blurRadius: 6,
                    color: CupertinoColors.black.withOpacity(0.15))
              ],
          filter: filter ?? ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          icon: RoundIconWithBlurredBackground(
            background: const Color(0xff212121),
            child: icon ?? const Icon(
              CupertinoIcons.exclamationmark_circle,
              color: Color(0xff212121),
              size: 25,
            ),
          ),
        );
}
