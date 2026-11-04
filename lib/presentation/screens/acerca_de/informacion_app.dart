import 'package:calculadora_kitty/presentation/screens/acerca_de/custom_scaffold_about.dart';
import 'package:flutter/material.dart';

class InformacionApp extends StatelessWidget {
  const InformacionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldAbout(
      title: "Información de la app",
      pathImage: "/icon/icon2.png",
      childrens: [
        Text(
          "Hello Kitty Calculator",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: .7),
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
          child: Text(
            "Versión 1.0.0",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),

        SizedBox(height: 15),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            "Calculadora estilo hello kitty",
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 15),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.shadow.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Tecnología",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  trailing: Text("Flutter", style: TextStyle(fontSize: 16)),
                  leading: Icon(Icons.code),
                ),
                ListTile(
                  title: Text(
                    "Diseño y desarrollo",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    "Alexis Mauricio Cruz Gonzaléz",
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
