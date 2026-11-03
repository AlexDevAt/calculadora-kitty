import 'package:calculadora_kitty/providers/settinsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Configuración",
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [_CustomContainer(widget: ThemeWidget())]),
      ),
    );
  }
}

class ThemeWidget extends ConsumerWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusModeLight = ref.watch(settingsProvider).isDarkMode;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tema",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _SeleccionTema(
                  onTap: ref.read(settingsProvider.notifier).changeLight,
                  title: "Claro",
                  isDark: false,
                  stateLight: !statusModeLight,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _SeleccionTema(
                  onTap: ref.read(settingsProvider.notifier).changeLight,
                  title: "Oscuro",
                  isDark: true,
                  stateLight: statusModeLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SeleccionTema extends StatelessWidget {
  const _SeleccionTema({
    required this.title,
    required this.isDark,
    required this.stateLight,
    required this.onTap,
  });

  final String title;
  final bool isDark;
  final bool stateLight;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),

      child: Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadiusGeometry.all(Radius.circular(15)),
          border: BoxBorder.all(color: Theme.of(context).colorScheme.outline),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(40),
                      child: Image.asset(
                        !isDark
                            ? "assets/extras/light_mode.png"
                            : "assets/extras/dark_mode.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 8,
              bottom: -2,
              child: Icon(
                color: Theme.of(context).colorScheme.onSurface,
                stateLight ? Icons.check_circle : Icons.radio_button_unchecked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        border: BoxBorder.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: widget,
    );
  }
}
