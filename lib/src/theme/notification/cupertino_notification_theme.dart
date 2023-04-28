import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class CupertinoNotificationTheme extends NotificationOverlayTheme {
  CupertinoNotificationTheme({
    super.icon = const Icon(
      CupertinoIcons.bell_circle_fill,
      color: Color(0xff212121),
      size: 18,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = CupertinoColors.white,
    super.titleTextStyle =
        const TextStyle(color: Color(0xff212121), fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: Color(0xff212121), fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: CupertinoColors.black)
              ],
        );

  CupertinoNotificationTheme.reload({
    super.icon = const Icon(
      CupertinoIcons.gobackward,
      color: CupertinoColors.white,
      size: 18,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff5f7c8a),
    super.titleTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: CupertinoColors.black)
              ],
        );

  CupertinoNotificationTheme.success({
    super.icon = const Icon(
      CupertinoIcons.check_mark_circled,
      color: CupertinoColors.white,
      size: 18,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff4cb050),
    super.titleTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: CupertinoColors.black)
              ],
        );

  CupertinoNotificationTheme.stop({
    super.icon = const Icon(
      CupertinoIcons.hand_raised_fill,
      color: CupertinoColors.white,
      size: 18,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xffff9700),
    super.titleTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: CupertinoColors.black)
              ],
        );

  CupertinoNotificationTheme.error({
    super.icon = const Icon(
      CupertinoIcons.clear_circled,
      color: CupertinoColors.white,
      size: 18,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xfff44236),
    super.titleTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: CupertinoColors.black)
              ],
        );

  CupertinoNotificationTheme.warning({
    super.icon = const Icon(
      CupertinoIcons.exclamationmark_circle,
      color: CupertinoColors.white,
      size: 18,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff3f51b5),
    super.titleTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: CupertinoColors.white, fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: CupertinoColors.black)
              ],
        );
}
