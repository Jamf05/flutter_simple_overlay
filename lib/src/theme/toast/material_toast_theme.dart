import 'package:flutter/material.dart';
import 'package:simple_overlay/simple_overlay.dart';

class MaterialToastTheme extends ToastOverlayTheme {
  MaterialToastTheme({
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff3c3b39),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
  }) : super(borderRadius: BorderRadius.circular(40));

  MaterialToastTheme.reload({
    super.icon = const Icon(
      Icons.replay,
      color: Colors.white,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff5f7c8a),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
  }) : super(borderRadius: BorderRadius.circular(40));

  MaterialToastTheme.success({
    super.icon = const Icon(
      Icons.check,
      color: Colors.white,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff4cb050),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
  }) : super(borderRadius: BorderRadius.circular(40));

  MaterialToastTheme.stop({
    super.icon = const Icon(
      Icons.back_hand,
      color: Colors.white,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xffff9700),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
  }) : super(borderRadius: BorderRadius.circular(40));

  MaterialToastTheme.error({
    super.icon = const Icon(
      Icons.close,
      color: Colors.white,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xfff44236),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
  }) : super(borderRadius: BorderRadius.circular(40));

  MaterialToastTheme.warning({
    super.icon = const Icon(
      Icons.warning_amber_rounded,
      color: Colors.white,
    ),
    super.duration = const Duration(milliseconds: 2500),
    super.background = const Color(0xff3f51b5),
    super.textStyle =
        const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
  }) : super(borderRadius: BorderRadius.circular(40));
}
