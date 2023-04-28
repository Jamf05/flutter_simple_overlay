part of '../simple_overlay.dart';

class _OverlayWidget extends StatefulWidget {
  final Widget? content;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? width;
  final Duration? duration;
  final OverlayType type;
  final void Function()? onTap;
  final Color background;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final OverlayPosition overlayPosition;
  final OverlayDisplacement? overlayDisplacement;
  final Color borderColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  const _OverlayWidget(
      {required this.content,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.duration,
      this.width,
      required this.type,
      this.onTap,
      this.padding,
      this.margin,
      this.background = Colors.white,
      this.overlayPosition = OverlayPosition.top,
      this.overlayDisplacement = OverlayDisplacement.none,
      required this.borderColor,
      required this.borderRadius,
      this.boxShadow});
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
      case OverlayType.snackBar:
        Offset begin = const Offset(0.0, 0.0);
        Offset end = const Offset(0.0, 0.0);
        switch (widget.overlayPosition) {
          case OverlayPosition.top:
            switch (widget.overlayDisplacement) {
              case OverlayDisplacement.leftToRight:
                begin = const Offset(-2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              case OverlayDisplacement.rightToLeft:
                begin = const Offset(2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              default:
                begin = const Offset(0.0, -2.0);
                end = const Offset(0.0, 0.0);
            }
            break;
          case OverlayPosition.bottom:
            switch (widget.overlayDisplacement) {
              case OverlayDisplacement.leftToRight:
                begin = const Offset(-2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              case OverlayDisplacement.rightToLeft:
                begin = const Offset(2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              default:
                begin = const Offset(0.0, 2.0);
                end = const Offset(0.0, 0.0);
            }
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
    }
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double? bottom;
    if (widget.bottom != null) {
      bottom = widget.bottom! + MediaQuery.of(context).viewInsets.bottom;
    }
    switch (widget.type) {
      case OverlayType.toast:
        return Positioned.fill(
            top: widget.top,
            left: widget.left,
            right: widget.right,
            bottom: bottom,
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
      case OverlayType.snackBar:
        return Positioned.fill(
            top: widget.top,
            left: widget.left,
            right: widget.right,
            bottom: bottom,
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
                                  margin: widget.margin,
                                  padding: widget.padding,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: widget.borderColor),
                                      borderRadius: widget.borderRadius,
                                      color: widget.background,
                                      boxShadow: widget.boxShadow),
                                  child: widget.content)),
                        )))));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
