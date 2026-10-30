import 'package:calculadora_kitty/botones.dart';
import 'package:calculadora_kitty/calculadora_logica.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  String inputScreen = "0";
  String inputReal = "0";

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
                      inputScreen,
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
                      inputScreen: inputScreen,
                      inputReal: inputReal,
                      valueChanged: (valueScreen, valueReal) => (setState(() {
                        inputScreen = valueScreen;
                        inputReal = valueReal;
                      })),
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
  const _BotonCalc({
    required this.boton,
    required this.valueChanged,
    required this.inputScreen,
    required this.inputReal,
  });

  final Boton boton;
  final void Function(String valueScreen, String valueReal) valueChanged;
  final String inputScreen;
  final String inputReal;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Material(
        color: boton.color,
        child: InkWell(
          onTap: () {
            switch (boton.type) {
              case typeButton.number:
                if (inputReal == "0") {
                  valueChanged(boton.valueScreen, boton.value);
                } else {
                  valueChanged(
                    inputScreen + boton.valueScreen,
                    inputReal + boton.value,
                  );
                }
                break;
              case typeButton.operator:
                final List<String> operadores = ["/", "*", "+"];

                if (inputReal == "0" && boton.value == "-") {
                  valueChanged("-", "-");
                  break;
                }

                if (inputReal == "-") {
                  valueChanged("0", "0");
                  break;
                }

                if (boton.value == inputReal[inputReal.length - 1]) {
                  break;
                }

                final String lastChar = inputReal[inputReal.length - 1];
                if (inputReal.length > 2) {
                  if (operadores.contains(inputReal[inputReal.length - 2]) &&
                      lastChar == "-") {
                    valueChanged(
                      inputScreen.substring(0, inputScreen.length - 2) +
                          boton.valueScreen,
                      inputReal.substring(0, inputReal.length - 2) +
                          boton.value,
                    );
                    break;
                  }
                }

                if (lastChar == "-" && operadores.contains(boton.value)) {
                  valueChanged(
                    inputScreen.substring(0, inputScreen.length - 1) +
                        boton.valueScreen,
                    inputReal.substring(0, inputReal.length - 1) + boton.value,
                  );
                  break;
                }

                if (boton.value == "-") {
                  if (lastChar == "/" || lastChar == "*") {
                    valueChanged(
                      inputScreen + boton.valueScreen,
                      inputReal + boton.value,
                    );
                    break;
                  }
                  if (lastChar == "+") {
                    valueChanged(
                      inputScreen.substring(0, inputScreen.length - 1) +
                          boton.valueScreen,
                      inputReal.substring(0, inputReal.length - 1) +
                          boton.value,
                    );
                    break;
                  }
                }

                if (boton.value == "+" && lastChar == "-") {
                  valueChanged(
                    inputScreen.substring(0, inputScreen.length - 1) +
                        boton.valueScreen,
                    inputReal.substring(0, inputReal.length - 1) + boton.value,
                  );
                  break;
                }

                if (operadores.contains(boton.value) &&
                    operadores.contains(lastChar)) {
                  valueChanged(
                    inputScreen.substring(0, inputScreen.length - 1) +
                        boton.valueScreen,
                    inputReal.substring(0, inputReal.length - 1) + boton.value,
                  );
                  break;
                }

                valueChanged(
                  inputScreen + boton.valueScreen,
                  inputReal + boton.value,
                );

                break;

              case typeButton.action:
                if (boton.value == "reset") {
                  valueChanged("0", "0");
                  break;
                }

                if (boton.value == "=") {
                  print("input a mandar : ${inputReal}");
                  final double res = CalculadoraLogica.obtenerResultado(
                    inputReal,
                  );
                  valueChanged(res.toString(), res.toString());
                  break;
                }

                if (boton.value == "sprm") {
                  if (inputReal.length == 1) {
                    valueChanged("0", "0");
                    break;
                  }

                  final String nuevoInputScreen = inputScreen.substring(
                    0,
                    inputScreen.length - 1,
                  );
                  final String nuevoInputReal = inputReal.substring(
                    0,
                    inputReal.length - 1,
                  );
                  valueChanged(nuevoInputScreen, nuevoInputReal);
                  break;
                }

              default:
                break;
            }
          },
          splashColor: Colors.black12,
          child: Center(
            child: boton.iconData == null
                ? Text(
                    boton.valueScreen,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  )
                : Icon(boton.iconData),
          ),
        ),
      ),
    );
  }
}
