part of '../simple_overlay.dart';

abstract class SnackBarOverlayTheme {
  final double widthFactor;
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
  final Duration removeDuration;
  final Duration animationDuration;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? boxShadow;

  SnackBarOverlayTheme({
    this.widthFactor = 0.85,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
    this.margin,
    this.duration = const Duration(seconds: 4),
    this.removeDuration = const Duration(seconds: 8),
    this.animationDuration = const Duration(milliseconds: 1300),
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
            TextButton.styleFrom(padding: const EdgeInsets.all(0)),
        assert(
          widthFactor >= 0 && widthFactor <= 1,
          '`widthFactor` must be a double between 0 and 1',
        );

  SnackBarOverlayTheme copyWith({
    double? widthFactor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? background,
    TextStyle? textStyle,
    int? textMaxLines,
    TextOverflow? textOverflow,
    ButtonStyle? styleActionButton,
    String? textActionButton,
    double? heightActionButton,
    Duration? duration,
    Duration? animationDuration,
    Duration? removeDuration,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
  });
}

class SnackBarOverlay extends SimpleOverlayInterface {
  SnackBarOverlay._(super.context);
  static SnackBarOverlay of(BuildContext context) => SnackBarOverlay._(context);
  void snackBar(String messaje,
      {required SnackBarOverlayTheme theme,
      OverlayPosition overlayPosition = const OverlayPosition.bottom(),
      OverlayDisplacement overlayDisplacement = OverlayDisplacement.none,
      bool bottomNavigationBar = false,
      double bottomNavigationBarHeight = kBottomNavigationBarHeight,
      Duration? duration,
      Duration? removeDuration,
      Duration? animationDuration}) async {
    OverlayState overlayState = Overlay.of(context);
    late AnimationController controller;
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
        builder: (context) => OverlayWidget(
              controller: (value) => controller = value,
              type: OverlayType.snackBar,
              top: overlayPosition.top,
              left: overlayPosition.left,
              bottom: overlayPosition.bottom,
              right: overlayPosition.right,
              duration: duration ?? theme.duration,
              animationDuration: animationDuration ?? theme.animationDuration,
              overlayPosition: overlayPosition,
              overlayDisplacement: overlayDisplacement,
              width: size.width * theme.widthFactor,
              padding: theme.padding,
              margin: theme.margin ??
                  EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width *
                          (1 - theme.widthFactor) /
                          2),
              background: theme.background,
              borderColor: Colors.transparent,
              borderRadius: theme.borderRadius,
              boxShadow: theme.boxShadow,
              bottomNavigationBar: bottomNavigationBar,
              bottomNavigationBarHeight: bottomNavigationBarHeight,
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
    Future.delayed(removeDuration ?? theme.removeDuration).then((_) {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
