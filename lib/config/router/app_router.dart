import 'package:calculadora_kitty/presentation/screens/app_configuration.dart';
import 'package:calculadora_kitty/screen_main.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => ScreenMain()),
    GoRoute(path: "/config", builder: (context, state) => AppConfiguration()),
  ],
);
