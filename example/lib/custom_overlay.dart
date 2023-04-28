import 'package:simple_overlay/simple_overlay.dart';

class CustomOverlays extends SimpleCustomOverlayInterface {
  CustomOverlays.of(super.context);

  @override
  MaterialToastTheme get toastTheme => MaterialToastTheme();
}
