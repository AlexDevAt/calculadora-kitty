import 'package:calculadora_kitty/config/preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings {
  final bool isDarkMode;
  final bool soundEnable;

  const Settings({this.isDarkMode = false, this.soundEnable = true});
}

class SettingsAppNotifier extends Notifier<Settings> {
  @override
  build() {
    return Settings();
  }

  void changeLight() {
    state = Settings(
      isDarkMode: !state.isDarkMode,
      soundEnable: state.soundEnable,
    );
    saveThemePreferences(state.isDarkMode);
  }

  void changeSoundMode() {
    state = Settings(
      isDarkMode: state.isDarkMode,
      soundEnable: !state.soundEnable,
    );
    saveSoundPreferences(state.soundEnable);
  }
}

final settingsProvider = NotifierProvider<SettingsAppNotifier, Settings>(
  SettingsAppNotifier.new,
);
