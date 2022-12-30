part of 'simple_overlay.dart';

abstract class SimpleOverlayInterface {
  final BuildContext _context;
  final Size _size;
  SimpleOverlayInterface(this._context) : _size = MediaQuery.of(_context).size;
}
