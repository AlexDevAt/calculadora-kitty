import 'package:calculadora_kitty/config/preferences.dart';
import 'package:calculadora_kitty/config/theme/app_theme.dart';
import 'package:calculadora_kitty/providers/settinsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final anyPreferTheme = await loadThemePreferences();
  final bool enableSound = await loadSoundPreferences();
  runApp(
    ProviderScope(
      overrides: [
        settingsProvider.overrideWithBuild(
          (_, _) =>
              Settings(isDarkMode: anyPreferTheme, soundEnable: enableSound),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool BrightnessMode = ref.watch(settingsProvider).isDarkMode;

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Calculadora Kitty',
      theme: BrightnessMode ? AppTheme.dark : AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
