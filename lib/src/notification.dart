part of '../simple_overlay.dart';

abstract class NotificationOverlayTheme {
  final Widget icon;
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
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow>? boxShadow;

  NotificationOverlayTheme({
    required this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
    BorderRadiusGeometry? borderRadius,
    this.boxShadow,
  }) : borderRadius = borderRadius ?? BorderRadius.circular(8.0);
}

class NotificationOverlay extends SimpleOverlayInterface {
  NotificationOverlay._(super.context);
  static NotificationOverlay of(BuildContext context) =>
      NotificationOverlay._(context);
  void notification(String title,
      {String? bodyText,
      Widget? body,
      required NotificationOverlayTheme theme,
      OverlayPosition overlayPosition = OverlayPosition.top,
      OverlayDisplacement overlayDisplacement = OverlayDisplacement.none}) {
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
    bool multiline = bodyText != null && bodyText.isNotEmpty;
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => OverlayWidget(
              type: OverlayType.notification,
              top: top,
              left: left,
              bottom: bottom,
              right: right,
              duration: theme.duration,
              overlayPosition: overlayPosition,
              overlayDisplacement: overlayDisplacement,
              width: size.width * 0.975,
              padding: theme.padding,
              margin: theme.margin ??
                  EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width * 0.025 / 2),
              background: theme.background,
              borderColor: theme.borderColor,
              borderRadius: theme.borderRadius,
              boxShadow: theme.boxShadow,
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
