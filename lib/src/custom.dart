import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

abstract class SimpleCustomOverlayInterface {
  final BuildContext context;
  final Size size;
  SimpleCustomOverlayInterface(this.context)
      : size = MediaQuery.of(context).size;

  final ToastOverlayTheme toastTheme = MaterialToastTheme();

  final NotificationOverlayTheme notificationTheme = MaterialNotificationTheme();

  final SnackBarOverlayTheme snackBarTheme = MaterialSnackBarTheme();

  void notification(
    String title, {
    String? bodyText,
    Widget? body,
    NotificationOverlayTheme? theme,
    OverlayDisplacement overlayDisplacement = OverlayDisplacement.none,
    OverlayPosition overlayPosition = OverlayPosition.top,
  }) =>
      NotificationOverlay.of(context).notification(
        title,
        bodyText: bodyText,
        body: body,
        theme: theme ?? notificationTheme,
        overlayDisplacement: overlayDisplacement,
        overlayPosition: overlayPosition,
      );

  void toast(String messaje, {ToastOverlayTheme? theme}) =>
      ToastOverlay.of(context).toast(messaje, theme: theme ?? toastTheme);

  void snackBar(String message, {SnackBarOverlayTheme? theme}) =>
      SnackBarOverlay.of(context)
          .snackBar(message, theme: theme ?? snackBarTheme);
}
