import 'package:calculadora_kitty/providers/settinsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      body: SingleChildScrollView(child: _view()),
    );
  }
}

class _view extends StatelessWidget {
  const _view();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _CustomContainer(widget: ThemeWidget()),
          SizedBox(height: 18),
          _CustomContainer(widget: SoundWidget()),
          SizedBox(height: 18),
          _CustomContainer(widget: _About()),
          SizedBox(height: 10),

          Center(
            child: Image.asset("assets/mascot/kitty_heart.png", height: 120),
          ),
        ],
      ),
    );
  }
}

class _About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          _CustomTitle(title: "Acerca de ", size: 20),
          _SeccionAbout(
            title: "Hello kitty calculadora ",
            icon: Icon(Icons.favorite, color: Colors.pink),
            trailing: Text("1.0.0", style: TextStyle(fontSize: 16)),
            path: "informacion-app",
          ),
          SizedBox(height: 8),
          _SeccionAbout(
            title: "Sobre el desarrollador",
            icon: Icon(Icons.code),
            trailing: Icon(Icons.chevron_right_outlined),
            path: "sobre-dev",
          ),
          SizedBox(height: 8),
          _SeccionAbout(
            title: "Inspiración",
            icon: Icon(Icons.star_border),
            trailing: Icon(Icons.chevron_right_outlined),
            path: "historia",
          ),
          SizedBox(height: 8),
          _SeccionAbout(
            title: "Gracias por usarla",
            icon: Icon(Icons.handshake),
            trailing: Icon(Icons.chevron_right_outlined),
            path: "agradecimiento",
          ),
        ],
      ),
    );
  }
}

class _SeccionAbout extends StatelessWidget {
  const _SeccionAbout({
    super.key,
    required this.title,
    required this.icon,
    required this.trailing,
    required this.path,
  });

  final String title;
  final Icon icon;
  final Widget trailing;
  final String path;

  @override
  Widget build(BuildContext context) {
    final Widget titleW = Text(title);

    return ListTile(
      contentPadding: EdgeInsetsGeometry.all(0),
      title: titleW,
      leading: icon,
      trailing: trailing,
      onTap: () => context.push("/${path}"),
    );
  }
}

class SoundWidget extends ConsumerWidget {
  const SoundWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _switchOn = ref.watch(settingsProvider).soundEnable;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.volume_up_outlined),
              SizedBox(width: 10),
              _CustomTitle(title: "Sonido", size: 20),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Sonido de botones",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              Spacer(),
              Switch(
                value: _switchOn,
                onChanged: (bool status) =>
                    (ref.read(settingsProvider.notifier).changeSoundMode()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomTitle extends StatelessWidget {
  const _CustomTitle({super.key, required this.title, required this.size});

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: size,
        color: Theme.of(context).colorScheme.onSurface,
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
          _CustomTitle(title: "Tema", size: 20),
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
        borderRadius: BorderRadiusGeometry.all(Radius.circular(15)),
        border: BoxBorder.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0,
        ),
      ),
      child: widget,
    );
  }
}
