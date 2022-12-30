part of 'simple_overlay.dart';

class NotificationOverlay extends SimpleOverlayInterface {
  NotificationOverlay._(super.context);
  static NotificationOverlay of(BuildContext context) => NotificationOverlay._(context);
  void notification(
    String? title, {
    String? subtitle,
    Widget? content,
    double? top,
    double? left,
    double? right,
    double? bottom,
    Widget? icon,
    Duration? duration,
    Duration? remove,
    void Function()? onTap,
    Color? background = Colors.white,
    Color? titleTextColor = Colors.black,
    TextStyle? style,
    Color? subTitleTextColor = Colors.black,
    TextStyle? subTitleStyle,
    NotificationPosition? notificationPosition = NotificationPosition.top,
    NotificationDisplacement? notificationDisplacement =
        NotificationDisplacement.none,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    OverlayState? overlayState = Overlay.of(_context);
    double? top, left, right, bottom;
    switch (notificationPosition) {
      case NotificationPosition.top:
        top = 10;
        left = null;
        right = null;
        bottom = null;
        break;
      case NotificationPosition.bottom:
        top = null;
        left = null;
        right = null;
        bottom = 10;
        break;
      default:
    }
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => _OverlayWidget(
              top: top ?? top,
              left: left ?? left,
              bottom: bottom ?? bottom,
              right: right ?? right,
              duration: duration ?? const Duration(seconds: 5),
              notificationPosition: notificationPosition,
              type: OverlayType.notification,
              notificationDisplacement: notificationDisplacement,
              width: margin == null ? _size.width * 0.95 : _size.width,
              padding: padding,
              margin: margin,
              onTap: onTap,
              background: background,
              content: content ??
                  Container(
                    color: background,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            icon ?? const SizedBox(),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                                child: Text(
                              title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: style ??
                                  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: titleTextColor ?? Colors.black),
                            )),
                          ],
                        ),
                        if (subtitle != null && subtitle != "")
                          const SizedBox(
                            height: 5,
                          ),
                        if (subtitle != null && subtitle != "")
                          Row(
                            children: [
                              Flexible(
                                  child: Text(
                                subtitle,
                                style: subTitleStyle ??
                                    TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color:
                                            subTitleTextColor ?? Colors.black),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ],
                          ),
                      ],
                    ),
                  ),
            ));
    overlayState?.insert(overlayEntry);
    Future.delayed(remove ?? const Duration(seconds: 10)).then((_) {
      overlayEntry.remove();
    });
  }
}

