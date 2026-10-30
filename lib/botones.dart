import 'package:flutter/material.dart';

enum typeButton { number, equal, operator, action }

class Boton {
  final String valueScreen;
  final Color color;
  final typeButton type;
  final IconData? iconData;
  final String value;

  Boton({
    required this.value,
    required this.valueScreen,
    required this.color,
    required this.type,
    this.iconData,
  });
}

final Color colorbotonNumber = Colors.pink.shade100;
final Color colorbotonOp = Colors.pink.shade400;

final List<Boton> botones = [
  Boton(
    valueScreen: '<-',
    color: colorbotonNumber,
    type: typeButton.action,
    iconData: Icons.backspace_outlined,
    value: "sprm",
  ),
  Boton(
    valueScreen: 'AC',
    color: colorbotonNumber,
    type: typeButton.action,
    value: "reset",
  ),
  Boton(
    valueScreen: '%',
    color: colorbotonNumber,
    type: typeButton.action,
    value: "%",
  ),
  Boton(
    valueScreen: '\u00F7',
    color: colorbotonOp,
    type: typeButton.operator,
    value: "/",
  ),
  Boton(
    valueScreen: '7',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "7",
  ),
  Boton(
    valueScreen: '8',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "8",
  ),
  Boton(
    valueScreen: '9',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "9",
  ),
  Boton(
    valueScreen: 'x',
    color: colorbotonOp,
    type: typeButton.operator,
    value: "*",
  ),
  Boton(
    valueScreen: '4',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "4",
  ),
  Boton(
    valueScreen: '5',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "5",
  ),
  Boton(
    valueScreen: '6',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "6",
  ),
  Boton(
    valueScreen: '-',
    color: colorbotonOp,
    type: typeButton.operator,
    value: "-",
  ),
  Boton(
    valueScreen: '1',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "1",
  ),
  Boton(
    valueScreen: '2',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "2",
  ),
  Boton(
    valueScreen: '3',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "3",
  ),
  Boton(
    valueScreen: '+',
    color: colorbotonOp,
    type: typeButton.operator,
    value: "+",
  ),
  Boton(
    valueScreen: '+/-',
    color: colorbotonNumber,
    type: typeButton.action,
    value: "not",
  ),
  Boton(
    valueScreen: '0',
    color: colorbotonNumber,
    type: typeButton.number,
    value: "0",
  ),
  Boton(
    valueScreen: '.',
    color: colorbotonNumber,
    type: typeButton.action,
    value: ".",
  ),
  Boton(
    valueScreen: '=',
    color: colorbotonOp,
    type: typeButton.action,
    value: "=",
  ),
];
