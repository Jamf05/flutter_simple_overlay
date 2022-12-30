part of 'simple_overlay.dart';

class ToastOverlay extends SimpleOverlayInterface {
  ToastOverlay._(super.context);
  static ToastOverlay of(BuildContext context) => ToastOverlay._(context);
  void toast(
      {BuildContext? context,
      Widget? content,
      Duration? duration,
      String? messaje,
      double? top,
      double? left,
      double? right,
      double? bottom = 20,
      Color? background = const Color(0xff646464),
      Color? textColor = Colors.white,
      TextStyle? style}) async {
    Widget defaultContent = SizedBox(
      width: _size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            constraints: BoxConstraints(
              maxWidth: _size.width * 0.9,
              minWidth: _size.width * 0.1,
            ),
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(20)),
            child: Text(
              messaje ?? '',
              style: style ?? TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );

    OverlayState? overlayState = Overlay.of(_context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => _OverlayWidget(
              content: content ?? defaultContent,
              top: top,
              left: left,
              bottom: bottom,
              right: right,
              width: _size.width,
              type: OverlayType.toast,
              duration: duration ?? const Duration(milliseconds: 2500),
              background: background,
            ));
    overlayState?.insert(overlayEntry);
    Future.delayed(const Duration(milliseconds: 3500)).then((_) {
      overlayEntry.remove();
    });
  }
}
