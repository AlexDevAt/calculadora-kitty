import 'package:flutter/material.dart';

enum typeButton { number, equal, operator, action }

class Boton {
  final String valueScreen;
  final typeButton type;
  final IconData? iconData;
  final String value;

  const Boton({
    required this.value,
    required this.valueScreen,
    required this.type,
    this.iconData,
  });

  Color getColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (type) {
      case typeButton.number:
        return isDark ? const Color(0xFF463544) : Colors.pink.shade100;

      case typeButton.operator:
        return isDark ? const Color(0xFFC9517C) : Colors.pink.shade400;

      case typeButton.equal:
        return isDark ? const Color(0xFFF15A8B) : Colors.pink.shade500;

      case typeButton.action:
        return isDark ? const Color(0xFF514052) : Colors.pink.shade100;
    }
  }
}

final List<Boton> botones = [
  Boton(
    valueScreen: '<-',
    type: typeButton.action,
    iconData: Icons.backspace_outlined,
    value: "sprm",
  ),
  Boton(valueScreen: 'AC', type: typeButton.action, value: "reset"),
  Boton(valueScreen: '%', type: typeButton.action, value: "%"),
  Boton(valueScreen: '÷', type: typeButton.operator, value: "/"),
  Boton(valueScreen: '7', type: typeButton.number, value: "7"),
  Boton(valueScreen: '8', type: typeButton.number, value: "8"),
  Boton(valueScreen: '9', type: typeButton.number, value: "9"),
  Boton(valueScreen: 'x', type: typeButton.operator, value: "*"),
  Boton(valueScreen: '4', type: typeButton.number, value: "4"),
  Boton(valueScreen: '5', type: typeButton.number, value: "5"),
  Boton(valueScreen: '6', type: typeButton.number, value: "6"),
  Boton(valueScreen: '-', type: typeButton.operator, value: "-"),
  Boton(valueScreen: '1', type: typeButton.number, value: "1"),
  Boton(valueScreen: '2', type: typeButton.number, value: "2"),
  Boton(valueScreen: '3', type: typeButton.number, value: "3"),
  Boton(valueScreen: '+', type: typeButton.operator, value: "+"),
  Boton(valueScreen: '+/-', type: typeButton.action, value: "not"),
  Boton(valueScreen: '0', type: typeButton.number, value: "0"),
  Boton(valueScreen: '.', type: typeButton.action, value: "."),
  Boton(valueScreen: '=', type: typeButton.action, value: "="),
];
