part of 'simple_overlay.dart';

class _OverlayWidget extends StatefulWidget {
  final Widget? content;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  final Duration? duration;
  final Duration? reverse;
  final OverlayType? type;
  final void Function()? onTap;
  final NotificationPosition? notificationPosition;
  final NotificationDisplacement? notificationDisplacement;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? background;
  const _OverlayWidget(
      {required this.content,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.duration,
      this.width,
      this.type,
      this.onTap,
      this.padding,
      this.margin,
      this.background,
      this.reverse,
      this.height,
      this.notificationPosition = NotificationPosition.top,
      this.notificationDisplacement = NotificationDisplacement.none});
  @override
  _OverlayWidgetState createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<_OverlayWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case OverlayType.dialog:
      case OverlayType.modal:
      case OverlayType.toast:
        controller = AnimationController(
            duration: const Duration(milliseconds: 250), vsync: this);
        animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
        animation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(widget.duration ?? const Duration(seconds: 1), () {
              if (mounted && controller.isCompleted == true) {
                controller.reverse();
              }
            });
          }
        });
        break;
      case OverlayType.notification:
        Offset begin;
        Offset end;
        switch (widget.notificationPosition) {
          case NotificationPosition.top:
            switch (widget.notificationDisplacement) {
              case NotificationDisplacement.leftToRight:
                begin = const Offset(-2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              case NotificationDisplacement.rightToLeft:
                begin = const Offset(2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              default:
                begin = const Offset(0.0, -2.0);
                end = const Offset(0.0, 0.0);
            }
            break;
          case NotificationPosition.bottom:
            switch (widget.notificationDisplacement) {
              case NotificationDisplacement.leftToRight:
                begin = const Offset(-2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              case NotificationDisplacement.rightToLeft:
                begin = const Offset(2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              default:
                begin = const Offset(0.0, 2.0);
                end = const Offset(0.0, 0.0);
            }
            break;
          default:
            begin = const Offset(0.0, 0.0);
            end = const Offset(0.0, 0.0);
        }
        controller = AnimationController(
            duration: const Duration(milliseconds: 1300), vsync: this);
        _offsetAnimation = Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ));
        _offsetAnimation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(widget.duration ?? const Duration(seconds: 1), () {
              if (mounted && controller.isCompleted == true) {
                controller.reverse();
              }
            });
          }
        });
        break;
      default:
    }
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case OverlayType.dialog:
        break;
      case OverlayType.modal:
        break;
      case OverlayType.toast:
        return Positioned.fill(
            top: widget.top,
            left: widget.left,
            right: widget.right,
            bottom: widget.bottom,
            child: Align(
              alignment: Alignment.center,
              child: FadeTransition(
                  opacity: animation,
                  child: GestureDetector(
                      onTap: () {
                        controller.reverse();
                      },
                      child: SafeArea(
                        child: Material(
                            color: Colors.transparent, child: widget.content),
                      ))),
            ));
      case OverlayType.notification:
        return Positioned.fill(
            top: widget.top,
            left: widget.left,
            right: widget.right,
            bottom: widget.bottom,
            child: Align(
                alignment: Alignment.center,
                child: SlideTransition(
                    position: _offsetAnimation,
                    child: GestureDetector(
                        onVerticalDragUpdate: (_) {
                          controller.reverse();
                          widget.onTap?.call();
                        },
                        onTap: () {
                          controller.reverse();
                          widget.onTap?.call();
                        },
                        child: SafeArea(
                          child: Material(
                              color: Colors.transparent,
                              child: Container(
                                  width: widget.width,
                                  height: widget.height,
                                  margin: widget.margin ??
                                      EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05 /
                                              2),
                                  padding: widget.padding ??
                                      const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 15.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFDBDBDB)),
                                      borderRadius: BorderRadius.circular(16),
                                      color: widget.background ??
                                          Colors.transparent),
                                  child: widget.content)),
                        )))));
      default:
        return Container();
    }
    return Container();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum NotificationPosition { top, bottom }

enum NotificationDisplacement { leftToRight, rightToLeft, none }

enum OverlayType { dialog, modal, toast, notification }
