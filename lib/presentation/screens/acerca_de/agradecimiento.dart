import 'package:calculadora_kitty/presentation/screens/acerca_de/custom_scaffold_about.dart';
import 'package:flutter/material.dart';

class AgradecimientosApp extends StatelessWidget {
  const AgradecimientosApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return CustomScaffoldAbout(
      title: "Agradecimientos",
      pathImage: "/decor/bow_outline.png",
      childrens: [
        const SizedBox(height: 25),

        Text(
          "¡Gracias por usarla!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: colors.primary,
          ),
        ),

        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            "Espero que disfrutes esta calculadora tanto como yo disfruté crearla.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: colors.onSurface,
              height: 1.4,
            ),
          ),
        ),

        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Volver a la calculadora",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
