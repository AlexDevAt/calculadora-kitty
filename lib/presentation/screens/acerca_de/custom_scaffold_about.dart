import 'package:flutter/material.dart';

class CustomScaffoldAbout extends StatelessWidget {
  const CustomScaffoldAbout({
    super.key,
    required this.title,
    required this.pathImage,
    required this.childrens,
  });

  final String title;
  final String pathImage;
  final List<Widget> childrens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hello kitty calculadora"),
        actions: [
          Image.asset("assets/decor/bow_outline.png", height: 40, width: 40),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 3.2),
                  Container(color: Colors.pink, height: 2, width: 50),
                  Center(
                    child: Image.asset(
                      "assets/decor/bow_outline.png",
                      width: 50,
                      height: 50,
                    ),
                  ),

                  Container(color: Colors.pink, height: 3, width: 50),
                ],
              ),
              Image.asset(
                "assets${pathImage}",
                height: MediaQuery.of(context).size.height * .20,
              ),
              ...childrens,
            ],
          ),
        ),
      ),
    );
  }
}
