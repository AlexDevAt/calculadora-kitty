import 'package:calculadora_kitty/presentation/screens/acerca_de/custom_scaffold_about.dart';
import 'package:flutter/material.dart';

class HistoriaApp extends StatelessWidget {
  const HistoriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return CustomScaffoldAbout(
      title: "La historia detrás de esta app",
      pathImage: "/icon/hearts.png",
      childrens: [
        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: colors.primary.withValues(alpha: 0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              "Esta aplicación nació de la idea de crear algo para mi pareja, inspirado en su gusto por Hello Kitty.",
              style: TextStyle(
                fontSize: 20,
                color: colors.onSurface,
                height: 1.5,
              ),
            ),
          ),
        ),

        const SizedBox(height: 35),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Para la persona que inspiró este proyecto.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: colors.primary,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 65,
              color: colors.primary.withValues(alpha: 0.4),
            ),

            const SizedBox(width: 10),

            Image.asset("assets/decor/bow_outline.png", width: 30, height: 30),

            const SizedBox(width: 10),

            Container(
              height: 1,
              width: 65,
              color: colors.primary.withValues(alpha: 0.4),
            ),
          ],
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
