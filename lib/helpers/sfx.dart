import 'package:audioplayers/audioplayers.dart';

class Sfx {
  static final audioPlayer = AudioPlayer()
    ..setPlayerMode(PlayerMode.lowLatency);

  static Future<void> play(String name) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource("sounds/${name}.wav"), volume: 0.7);
  }

  static void tap() => play("tap");
  static void delete() => play("delete");
  static void operator() => play("operator");
  static void error() => play("error");
}
