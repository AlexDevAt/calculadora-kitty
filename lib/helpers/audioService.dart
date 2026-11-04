import 'package:calculadora_kitty/helpers/sfx.dart';

class Audioservice {
  final Sfx sfx;
  final bool Function() onTapSound;

  Audioservice({required this.sfx, required this.onTapSound});

  void playSound(TypeSound type) {
    if (!onTapSound()) {
      return;
    }
    sfx.play(type);
  }
}
