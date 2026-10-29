import 'package:calculadora_kitty/botones.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/clean_native/bg_light.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/mascot/hello_kitty.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink.shade100,
                  border: BoxBorder.all(color: Colors.pink),
                ),
                height: 90,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "50",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  ...botones.map(
                    (btn) => _BotonCalc(
                      boton: btn,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonCalc extends StatelessWidget {
  const _BotonCalc({required this.boton});

  final Boton boton;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Material(
        color: boton.color,
        child: InkWell(
          onTap: () => (),
          splashColor: Colors.black12,
          child: Center(
            child: boton.iconData == null
                ? Text(
                    boton.value,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  )
                : Icon(boton.iconData),
          ),
        ),
      ),
    );
  }
}
