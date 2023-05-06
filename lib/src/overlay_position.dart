class OverlayPosition {
  final double? top;

  final double? right;

  final double? bottom;

  final double? left;

  final bool isTop;

  final bool isBottom;

  const OverlayPosition.top({
    this.top = 10,
  })  : isTop = true,
        isBottom = false,
        right = null,
        bottom = null,
        left = null;

  const OverlayPosition.bottom({
    this.bottom = 10,
  })  : isBottom = true,
        isTop = false,
        top = null,
        right = null,
        left = null;

  const OverlayPosition({
    this.top,
    this.right,
    this.left,
    this.bottom,
  })  : isTop = false,
        isBottom = false;

  OverlayPosition copyWith({
    double? top,
    double? right,
    double? bottom,
    double? left,
  }) {
    return OverlayPosition(
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
    );
  }
}
