import 'package:calculadora_kitty/presentation/screens/acerca_de/agradecimiento.dart';
import 'package:calculadora_kitty/presentation/screens/acerca_de/historia_app.dart';
import 'package:calculadora_kitty/presentation/screens/acerca_de/informacion_app.dart';
import 'package:calculadora_kitty/presentation/screens/acerca_de/sobre_desarrollador.dart';
import 'package:calculadora_kitty/presentation/screens/app_configuration.dart';
import 'package:calculadora_kitty/screen_main.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => ScreenMain()),
    GoRoute(path: "/config", builder: (context, state) => AppConfiguration()),
    GoRoute(
      path: "/informacion-app",
      builder: ((context, state) => InformacionApp()),
    ),
    GoRoute(
      path: "/sobre-dev",
      builder: (context, state) => SobreDesarrollador(),
    ),
    GoRoute(path: "/historia", builder: (context, state) => HistoriaApp()),
    GoRoute(
      path: "/agradecimiento",
      builder: (context, state) => AgradecimientosApp(),
    ),
  ],
);
