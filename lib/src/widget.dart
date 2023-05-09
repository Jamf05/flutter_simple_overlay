part of '../simple_overlay.dart';

class OverlayWidget extends StatefulWidget {
  final Widget? content;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? width;
  final Duration duration;
  final Duration animationDuration;
  final OverlayType type;
  final void Function()? onTap;
  final Color background;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final OverlayPosition overlayPosition;
  final OverlayDisplacement? overlayDisplacement;
  final Color borderColor;
  final double borderWidth;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final void Function(AnimationController)? controller;
  final ImageFilter filter;
  final bool bottomNavigationBar;
  final double bottomNavigationBarHeight;
  OverlayWidget(
      {super.key,
      required this.content,
      this.controller,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.duration = const Duration(seconds: 1),
      this.animationDuration = const Duration(seconds: 1),
      this.width,
      required this.type,
      this.onTap,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.background = Colors.white,
      this.overlayPosition = const OverlayPosition.top(),
      this.overlayDisplacement = OverlayDisplacement.none,
      required this.borderColor,
      this.borderWidth = 0,
      required this.borderRadius,
      ImageFilter? filter,
      this.boxShadow,
      this.bottomNavigationBar = false,
      this.bottomNavigationBarHeight = kBottomNavigationBarHeight})
      : filter = filter ?? ImageFilter.blur(sigmaX: 0, sigmaY: 0);
  @override
  OverlayWidgetState createState() => OverlayWidgetState();
}

class OverlayWidgetState extends State<OverlayWidget>
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
            duration: widget.animationDuration, vsync: this);
        animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
        animation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(widget.duration, () {
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
        if (widget.overlayPosition.isTop) {
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
        } else if (widget.overlayPosition.isBottom) {
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
            duration: widget.animationDuration, vsync: this);
        _offsetAnimation = Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ));
        _offsetAnimation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(widget.duration, () {
              if (mounted && controller.isCompleted == true) {
                controller.reverse();
              }
            });
          }
        });
        break;
    }
    controller.forward();
    widget.controller?.call(controller);
  }

  @override
  Widget build(BuildContext context) {
    double? bottom;
    if (widget.bottom != null) {
      final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      bottom = widget.bottom! + keyboardHeight;
      if (keyboardHeight == 0 && widget.bottomNavigationBar) {
        bottom = bottom + widget.bottomNavigationBarHeight;
      }
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
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: widget.borderColor,
                                          width: widget.borderWidth),
                                      borderRadius: widget.borderRadius,
                                      color: widget.background,
                                      boxShadow: widget.boxShadow),
                                  child: ClipRRect(
                                      borderRadius: widget.borderRadius,
                                      child: BackdropFilter(
                                          filter: widget.filter,
                                          child: Padding(
                                            padding: widget.padding,
                                            child: widget.content,
                                          ))))),
                        )))));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
