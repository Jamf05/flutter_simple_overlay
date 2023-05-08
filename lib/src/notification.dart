part of '../simple_overlay.dart';

abstract class NotificationOverlayTheme {
  final Widget icon;
  final double widthFactor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Duration duration;
  final Duration reverseDuration;
  final void Function()? onTap;
  final Color background;
  final TextStyle titleTextStyle;
  final int titleTextMaxLines;
  final TextOverflow titleTextOverflow;
  final TextStyle bodyTextStyle;
  final int bodyTextMaxLines;
  final TextOverflow bodyTextOverflow;
  final Color borderColor;
  final double borderWidth;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? boxShadow;
  final ImageFilter filter;

  NotificationOverlayTheme(
      {required this.icon,
      this.widthFactor = 0.975,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      this.margin,
      this.duration = const Duration(seconds: 5),
      this.reverseDuration = const Duration(seconds: 10),
      this.onTap,
      this.background = Colors.white,
      this.titleTextStyle =
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      this.titleTextMaxLines = 1,
      this.titleTextOverflow = TextOverflow.ellipsis,
      this.bodyTextStyle =
          const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      this.bodyTextMaxLines = 2,
      this.bodyTextOverflow = TextOverflow.ellipsis,
      this.borderColor = const Color(0xFFDBDBDB),
      this.borderWidth = 0,
      BorderRadiusGeometry? borderRadius,
      ImageFilter? filter,
      this.boxShadow})
      : filter = filter ?? ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        borderRadius = borderRadius ?? BorderRadius.circular(8.0),
        assert(
          widthFactor >= 0 && widthFactor <= 1,
          '`widthFactor` must be a double between 0 and 1',
        );

  NotificationOverlayTheme copyWith({
    Widget? icon,
    double? widthFactor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration? duration,
    Duration? reverseDuration,
    void Function()? onTap,
    Color? background,
    TextStyle? titleTextStyle,
    int? titleTextMaxLines,
    TextOverflow? titleTextOverflow,
    TextStyle? bodyTextStyle,
    int? bodyTextMaxLines,
    TextOverflow? bodyTextOverflow,
    Color? borderColor,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    ImageFilter? filter,
  });
}

class NotificationOverlay extends SimpleOverlayInterface {
  NotificationOverlay._(super.context);
  static NotificationOverlay of(BuildContext context) =>
      NotificationOverlay._(context);
  void notification(String title,
      {String? bodyText,
      Widget? body,
      required NotificationOverlayTheme theme,
      OverlayPosition overlayPosition = const OverlayPosition.top(),
      OverlayDisplacement overlayDisplacement = OverlayDisplacement.none,
      bool bottomNavigationBar = false,
      double bottomNavigationBarHeight = kBottomNavigationBarHeight}) {
    OverlayState overlayState = Overlay.of(context);
    bool multiline = bodyText != null && bodyText.isNotEmpty;
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => OverlayWidget(
              type: OverlayType.notification,
              top: overlayPosition.top,
              left: overlayPosition.left,
              bottom: overlayPosition.bottom,
              right: overlayPosition.right,
              duration: theme.duration,
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
              borderColor: theme.borderColor,
              borderWidth: theme.borderWidth,
              borderRadius: theme.borderRadius,
              boxShadow: theme.boxShadow,
              filter: theme.filter,
              bottomNavigationBar: bottomNavigationBar,
              bottomNavigationBarHeight: bottomNavigationBarHeight,
              content: body ??
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          theme.icon,
                          SizedBox(
                            width: multiline ? 5 : 10,
                          ),
                          Flexible(
                              child: Text(
                            title,
                            maxLines: theme.titleTextMaxLines,
                            overflow: theme.titleTextOverflow,
                            style: theme.titleTextStyle,
                          )),
                        ],
                      ),
                      if (multiline) ...[
                        SizedBox(
                          height: multiline ? 5 : 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                                child: Text(
                              bodyText,
                              style: theme.bodyTextStyle,
                              maxLines: theme.bodyTextMaxLines,
                              overflow: theme.bodyTextOverflow,
                            )),
                          ],
                        ),
                      ]
                    ],
                  ),
              onTap: theme.onTap,
            ));
    overlayState.insert(overlayEntry);
    Future.delayed(theme.reverseDuration).then((_) {
      overlayEntry.remove();
    });
  }
}
