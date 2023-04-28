part of '../simple_overlay.dart';

abstract class SnackBarOverlayTheme {
  final Widget? icon;
  final Color background;
  final TextStyle? textStyle;
  final int textMaxLines;
  final TextOverflow textOverflow;
  final Duration duration;
  final Duration reverseDuration;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? boxShadow;

  SnackBarOverlayTheme({
    this.icon,
    this.duration = const Duration(seconds: 4),
    this.reverseDuration = const Duration(seconds: 8),
    this.background = Colors.white,
    this.textStyle,
    this.textMaxLines = 2,
    this.textOverflow = TextOverflow.ellipsis,
    BorderRadiusGeometry? borderRadius,
    this.boxShadow,
  }) : borderRadius = borderRadius ?? BorderRadius.circular(20);
}

class SnackBarOverlay extends SimpleOverlayInterface {
  SnackBarOverlay._(super.context);
  static SnackBarOverlay of(BuildContext context) => SnackBarOverlay._(context);
  void snackBar(String messaje,
      {required SnackBarOverlayTheme theme,
      OverlayPosition overlayPosition = OverlayPosition.bottom,
      OverlayDisplacement overlayDisplacement =
          OverlayDisplacement.none}) async {
    OverlayState? overlayState = Overlay.of(context);
    double? top, left, right, bottom;
    switch (overlayPosition) {
      case OverlayPosition.top:
        top = 10;
        left = null;
        right = null;
        bottom = null;
        break;
      case OverlayPosition.bottom:
        top = null;
        left = null;
        right = null;
        bottom = 10;
        break;
      default:
    }
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => _OverlayWidget(
              type: OverlayType.snackBar,
              top: top,
              left: left,
              bottom: bottom,
              right: right,
              duration: theme.duration,
              overlayPosition: overlayPosition,
              overlayDisplacement: overlayDisplacement,
              width: size.width * 0.85,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15 / 2),
              background: theme.background,
              borderColor: Colors.transparent,
              borderRadius: theme.borderRadius,
              boxShadow: theme.boxShadow,
              content: Container(
                color: theme.background,
                child: Text(
                  messaje,
                  maxLines: theme.textMaxLines,
                  overflow: theme.textOverflow,
                  style: theme.textStyle,
                ),
              ),
            ));
    overlayState.insert(overlayEntry);
    Future.delayed(theme.reverseDuration).then((_) {
      overlayEntry.remove();
    });
  }
}
