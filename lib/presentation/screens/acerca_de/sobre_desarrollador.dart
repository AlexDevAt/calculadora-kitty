import 'package:calculadora_kitty/presentation/screens/acerca_de/custom_scaffold_about.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SobreDesarrollador extends StatelessWidget {
  const SobreDesarrollador({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return CustomScaffoldAbout(
      title: "Sobre el desarrollador",
      pathImage: "/icon/code.png",
      childrens: [
        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colors.outlineVariant, width: 1),
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Alexis Mauricio Cruz González",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Estudiante de Ingeniería en TICs",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: colors.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 20),

                Divider(color: colors.primary.withValues(alpha: 0.2)),

                const SizedBox(height: 20),

                Text(
                  "Me gusta la programación, especialmente el desarrollo de software y las aplicaciones móviles.",
                  style: TextStyle(fontSize: 16, color: colors.onSurface),
                ),

                const SizedBox(height: 20),

                Text(
                  "Esta calculadora es un proyecto personal desarrollado con Flutter para practicar y seguir aprendiendo.",
                  style: TextStyle(fontSize: 16, color: colors.onSurface),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colors.outlineVariant),
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tecnologías",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),

                const SizedBox(height: 15),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(
                      label: const Text("Flutter"),
                      backgroundColor: colors.surface,
                      side: BorderSide(color: colors.primary),
                      labelStyle: TextStyle(
                        color: colors.primary,
                        fontSize: 16,
                      ),
                    ),

                    Chip(
                      label: const Text("Dart"),
                      backgroundColor: colors.surface,
                      side: BorderSide(color: colors.primary),
                      labelStyle: TextStyle(
                        color: colors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: OutlinedButton.icon(
              onPressed: () async {
                final url = Uri.parse("https://github.com/AlexDevAt");
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
              icon: const Icon(Icons.code),
              label: const Text(
                "Ver mis proyectos",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: colors.primary,
                side: BorderSide(color: colors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
