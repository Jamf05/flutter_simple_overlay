part of '../simple_overlay.dart';

abstract class ToastOverlayTheme {
  final Widget? icon;
  final Color background;
  final TextStyle textStyle;
  final int textMaxLines;
  final TextOverflow textoverflow;
  final Duration duration;
  final Duration reverseDuration;
  final BorderRadiusGeometry borderRadius;

  ToastOverlayTheme(
      {this.icon,
      this.duration = const Duration(milliseconds: 2500),
      this.reverseDuration = const Duration(milliseconds: 3500),
      this.background = Colors.black,
      this.textStyle = const TextStyle(),
      this.textMaxLines = 2,
      this.textoverflow = TextOverflow.ellipsis,
      BorderRadiusGeometry? borderRadius})
      : borderRadius = borderRadius ?? BorderRadius.circular(20);
}

class ToastOverlay extends SimpleOverlayInterface {
  ToastOverlay._(super.context);
  static ToastOverlay of(BuildContext context) => ToastOverlay._(context);
  void toast(
    String messaje, {
    required ToastOverlayTheme theme,
    OverlayPosition overlayPosition = const OverlayPosition.top(),
    bool bottomNavigationBar = false
  }) async {
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
              constraints: BoxConstraints(
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

    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => OverlayWidget(
              type: OverlayType.toast,
              top: overlayPosition.top,
              left: overlayPosition.left,
              right: overlayPosition.right,
              bottom: overlayPosition.bottom,
              content: content,
              width: size.width,
              duration: theme.duration,
              background: theme.background,
              overlayPosition: overlayPosition,
              overlayDisplacement: OverlayDisplacement.none,
              borderColor: Colors.transparent,
              borderRadius: theme.borderRadius,
              bottomNavigationBar: bottomNavigationBar,
            ));
    overlayState.insert(overlayEntry);
    Future.delayed(theme.reverseDuration).then((_) {
      overlayEntry.remove();
    });
  }
}
