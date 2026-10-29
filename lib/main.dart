import 'package:calculadora_kitty/screen_main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Kitty',
      debugShowCheckedModeBanner: false,
      home: ScreenMain(),
    );
  }
}