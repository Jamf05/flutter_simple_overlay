import 'dart:ui';

import 'package:flutter/cupertino.dart';

class RoundIconWithBlurredBackground extends StatelessWidget {
  final ImageFilter imageFilter;
  final BorderRadiusGeometry borderRadius;
  final Widget child;
  final Color background;
  final EdgeInsetsGeometry padding;
  final double size;
  RoundIconWithBlurredBackground(
      {super.key,
      required this.child,
      ImageFilter? imageFilter,
      BorderRadiusGeometry? borderRadius,
      required this.background,
      this.size = 25,
      this.padding = const EdgeInsets.all(5)})
      : borderRadius = borderRadius ?? BorderRadius.circular(16.0),
        imageFilter =
            imageFilter ?? ImageFilter.blur(sigmaX: 250.0, sigmaY: 250.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius,
          child: ImageFiltered(
            imageFilter: imageFilter,
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: background,
              ),
              child: SizedBox(
                width: size,
                height: size,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: child,
          ),
        )
      ],
    );
  }
}
