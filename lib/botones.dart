import 'package:flutter/material.dart';

enum typeButton { number, equal, operator, action }

class Boton {
  final String value;
  final Color color;
  final typeButton type;
  final IconData? iconData;

  Boton( {required this.value, required this.color, required this.type,this.iconData});
}

final Color colorbotonNumber = Colors.pink.shade100;
final Color colorbotonOp = Colors.pink.shade400;

final List<Boton> botones = [
  Boton(value: '<-', color: colorbotonNumber, type: typeButton.action,iconData: Icons.backspace_outlined),
  Boton(value: 'AC', color: colorbotonNumber, type: typeButton.action),
  Boton(value: '%', color: colorbotonNumber, type: typeButton.action),
  Boton(value: '\u00F7', color: colorbotonOp, type: typeButton.operator),
  Boton(value: '7', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '8', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '9', color: colorbotonNumber, type: typeButton.number),
  Boton(value: 'x', color: colorbotonOp, type: typeButton.operator),
  Boton(value: '4', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '5', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '6', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '-', color: colorbotonOp, type: typeButton.operator),
  Boton(value: '1', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '2', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '3', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '+', color: colorbotonOp, type: typeButton.operator),
  Boton(value: '+/-', color: colorbotonNumber, type: typeButton.action),
  Boton(value: '0', color: colorbotonNumber, type: typeButton.number),
  Boton(value: '.', color: colorbotonNumber, type: typeButton.action),
  Boton(value: '=', color: colorbotonOp, type: typeButton.equal),
];
