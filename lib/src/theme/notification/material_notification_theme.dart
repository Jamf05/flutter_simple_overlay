import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class MaterialNotificationTheme extends NotificationOverlayTheme {
  MaterialNotificationTheme({
    super.icon = const Icon(
      Icons.notifications_active_outlined,
      color: Color(0xff212121),
      size: 18,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = Colors.white,
    super.titleTextStyle =
        const TextStyle(color: Color(0xff212121), fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: Color(0xff212121), fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
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
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff5f7c8a),
    super.titleTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
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
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff4cb050),
    super.titleTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
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
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xffff9700),
    super.titleTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
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
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xfff44236),
    super.titleTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
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
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff3f51b5),
    super.titleTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.bodyTextStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
    super.borderColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
  }) : super(
          boxShadow: boxShadow ??
              <BoxShadow>[
                const BoxShadow(blurRadius: 6, color: Colors.black12)
              ],
        );
}
