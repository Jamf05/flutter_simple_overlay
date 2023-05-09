import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

abstract class SimpleCustomOverlayInterface {
  final BuildContext context;
  final Size size;
  SimpleCustomOverlayInterface(this.context)
      : size = MediaQuery.of(context).size;

  final double bottomNavigationBarHeight = kBottomNavigationBarHeight;

  final ToastOverlayTheme toastTheme = MaterialToastTheme();

  final NotificationOverlayTheme notificationTheme =
      MaterialNotificationTheme();

  final SnackBarOverlayTheme snackBarTheme = MaterialSnackBarTheme();

  void notification(
    String title, {
    String? bodyText,
    Widget? body,
    NotificationOverlayTheme? theme,
    OverlayDisplacement overlayDisplacement = OverlayDisplacement.none,
    OverlayPosition overlayPosition = const OverlayPosition.top(),
    bool bottomNavigationBar = false,
    Duration? duration,
    Duration? animationDuration,
    Duration? removeDuration,
  }) =>
      NotificationOverlay.of(context).notification(
        title,
        bodyText: bodyText,
        body: body,
        theme: theme ?? notificationTheme,
        overlayDisplacement: overlayDisplacement,
        overlayPosition: overlayPosition,
        bottomNavigationBar: bottomNavigationBar,
        bottomNavigationBarHeight: bottomNavigationBarHeight,
        duration: duration,
        animationDuration: animationDuration,
        removeDuration: removeDuration,
      );

  void toast(
    String messaje, {
    ToastOverlayTheme? theme,
    OverlayPosition overlayPosition = const OverlayPosition.bottom(),
    bool bottomNavigationBar = false,
    Duration? duration,
    Duration? animationDuration,
    Duration? removeDuration,
  }) =>
      ToastOverlay.of(context).toast(
        messaje,
        theme: theme ?? toastTheme,
        overlayPosition: overlayPosition,
        bottomNavigationBar: bottomNavigationBar,
        bottomNavigationBarHeight: bottomNavigationBarHeight,
        duration: duration,
        animationDuration: animationDuration,
        removeDuration: removeDuration,
      );

  void snackBar(
    String message, {
    SnackBarOverlayTheme? theme,
    OverlayPosition overlayPosition = const OverlayPosition.bottom(),
    OverlayDisplacement overlayDisplacement = OverlayDisplacement.none,
    bool bottomNavigationBar = false,
    Duration? duration,
    Duration? animationDuration,
    Duration? removeDuration,
  }) =>
      SnackBarOverlay.of(context).snackBar(
        message,
        theme: theme ?? snackBarTheme,
        overlayPosition: overlayPosition,
        overlayDisplacement: overlayDisplacement,
        bottomNavigationBar: bottomNavigationBar,
        bottomNavigationBarHeight: bottomNavigationBarHeight,
        duration: duration,
        animationDuration: animationDuration,
        removeDuration: removeDuration,
      );
}
