import 'package:calculadora_kitty/helpers/audioService.dart';
import 'package:calculadora_kitty/helpers/sfx.dart';
import 'package:calculadora_kitty/providers/settinsApp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioProvider = Provider<Audioservice>((ref) {
  return Audioservice(
    sfx: Sfx(),
    onTapSound: () => ref.read(settingsProvider).soundEnable,
  );
});
