import 'package:audioplayers/audioplayers.dart';

enum TypeSound {
  Tap("tap"),
  Delete("delete"),
  Operator("operator"),
  Error("error");

  final String label;

  const TypeSound(this.label);
}

class Sfx {
  final audioPlayer = AudioPlayer()..setPlayerMode(PlayerMode.lowLatency);

  Future<void> play(TypeSound type) async {
    await audioPlayer.stop();
    await audioPlayer.play(
      AssetSource("sounds/${type.label}.wav"),
      volume: 0.7,
    );
  }
}
