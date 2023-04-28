part of '../simple_overlay.dart';

abstract class SimpleOverlayInterface {
  final BuildContext context;
  final Size size;
  SimpleOverlayInterface(this.context) : size = MediaQuery.of(context).size;
}
