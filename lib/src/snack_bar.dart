part of '../simple_overlay.dart';

abstract class SnackBarOverlayTheme {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color background;
  final TextStyle textStyle;
  final int textMaxLines;
  final TextOverflow textOverflow;
  final ButtonStyle? styleActionButton;
  final String textActionButton;
  final double heightActionButton;
  final Duration duration;
  final Duration reverseDuration;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? boxShadow;

  SnackBarOverlayTheme({
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
    this.margin,
    this.duration = const Duration(seconds: 4),
    this.reverseDuration = const Duration(seconds: 8),
    this.background = Colors.white,
    this.textStyle = const TextStyle(),
    this.textMaxLines = 2,
    this.textOverflow = TextOverflow.ellipsis,
    BorderRadiusGeometry? borderRadius,
    this.boxShadow,
    this.textActionButton = "Action",
    this.heightActionButton = 20.0,
    ButtonStyle? styleActionButton,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(20),
        styleActionButton = styleActionButton ??
            TextButton.styleFrom(padding: const EdgeInsets.all(0));
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
    late AnimationController controller;
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
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
        builder: (context) => OverlayWidget(
              controller: (value) => controller = value,
              type: OverlayType.snackBar,
              top: top,
              left: left,
              bottom: bottom,
              right: right,
              duration: theme.duration,
              overlayPosition: overlayPosition,
              overlayDisplacement: overlayDisplacement,
              width: size.width * 0.85,
              padding: theme.padding,
              margin: theme.margin ??
                  EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15 / 2),
              background: theme.background,
              borderColor: Colors.transparent,
              borderRadius: theme.borderRadius,
              boxShadow: theme.boxShadow,
              content: Container(
                color: theme.background,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Text(
                          messaje,
                          maxLines: theme.textMaxLines,
                          overflow: theme.textOverflow,
                          style: theme.textStyle,
                        )),
                    const Spacer(),
                    SizedBox(
                      height: theme.heightActionButton,
                      child: TextButton(
                          style: theme.styleActionButton,
                          onPressed: () => controller.reverse(),
                          child: Text(theme.textActionButton)),
                    ),
                  ],
                ),
              ),
            ));
    overlayState.insert(overlayEntry);
    Future.delayed(theme.reverseDuration).then((_) {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
