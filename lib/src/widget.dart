part of '../simple_overlay.dart';

class OverlayWidget extends StatefulWidget {
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
  OverlayWidget(
      {super.key,
      required this.content,
      this.controller,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.duration,
      this.width,
      required this.type,
      this.onTap,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.background = Colors.white,
      this.overlayPosition = OverlayPosition.top,
      this.overlayDisplacement = OverlayDisplacement.none,
      required this.borderColor,
      this.borderWidth = 0,
      required this.borderRadius,
      ImageFilter? filter,
      this.boxShadow})
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
    widget.controller?.call(controller);
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
