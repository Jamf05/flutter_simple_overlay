part of '../simple_overlay.dart';

abstract class ToastOverlayTheme {
  final Widget? icon;
  final double widthFactor;
  final BoxConstraints? constraints;
  final Color background;
  final TextStyle textStyle;
  final int textMaxLines;
  final TextOverflow textoverflow;
  final Duration duration;
  final Duration reverseDuration;
  final BorderRadiusGeometry borderRadius;

  ToastOverlayTheme(
      {this.icon,
      this.widthFactor = 1,
      this.constraints,
      this.duration = const Duration(milliseconds: 2500),
      this.reverseDuration = const Duration(milliseconds: 3500),
      this.background = Colors.black,
      this.textStyle = const TextStyle(),
      this.textMaxLines = 2,
      this.textoverflow = TextOverflow.ellipsis,
      BorderRadiusGeometry? borderRadius})
      : borderRadius = borderRadius ?? BorderRadius.circular(20),
        assert(
          widthFactor >= 0 && widthFactor <= 1,
          '`widthFactor` must be a double between 0 and 1',
        );

  ToastOverlayTheme copyWith({
    Widget? icon,
    double? widthFactor,
    BoxConstraints? constraints,
    Color? background,
    TextStyle? textStyle,
    int? textMaxLines,
    TextOverflow? textoverflow,
    Duration? duration,
    Duration? reverseDuration,
    BorderRadiusGeometry? borderRadius,
  });
}

class ToastOverlay extends SimpleOverlayInterface {
  ToastOverlay._(super.context);
  static ToastOverlay of(BuildContext context) => ToastOverlay._(context);
  void toast(String messaje,
      {required ToastOverlayTheme theme,
      OverlayPosition overlayPosition = const OverlayPosition.top(),
      bool bottomNavigationBar = false,
      double bottomNavigationBarHeight = kBottomNavigationBarHeight}) async {
    Widget text = Text(
      messaje,
      style: theme.textStyle,
      maxLines: theme.textMaxLines,
      overflow: theme.textoverflow,
    );
    Widget content = SizedBox(
      width: size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              constraints: theme.constraints ??
                  BoxConstraints(
                    maxWidth: size.width * 0.9,
                    minWidth: size.width * 0.1,
                  ),
              decoration: BoxDecoration(
                  color: theme.background, borderRadius: theme.borderRadius),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (theme.icon != null) ...[
                    theme.icon!,
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                  Flexible(child: text),
                ],
              ))
        ],
      ),
    );

    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => OverlayWidget(
              type: OverlayType.toast,
              top: overlayPosition.top,
              left: overlayPosition.left,
              right: overlayPosition.right,
              bottom: overlayPosition.bottom,
              content: content,
              width: size.width * theme.widthFactor,
              duration: theme.duration,
              background: theme.background,
              overlayPosition: overlayPosition,
              overlayDisplacement: OverlayDisplacement.none,
              borderColor: Colors.transparent,
              borderRadius: theme.borderRadius,
              bottomNavigationBar: bottomNavigationBar,
              bottomNavigationBarHeight: bottomNavigationBarHeight,
            ));
    overlayState.insert(overlayEntry);
    Future.delayed(theme.reverseDuration).then((_) {
      overlayEntry.remove();
    });
  }
}
