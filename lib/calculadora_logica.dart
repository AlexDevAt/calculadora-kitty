import 'dart:collection';

class Node {
  final String children;
  final Node? left;
  final Node? rigth;

  Node({required this.children, required this.left, required this.rigth});
}

class ArbolBinario {
  Node? raiz;

  ArbolBinario();

  void insertar(List<String> inputPostFijo) {
    final Queue<Node> pilaNodos = Queue();
    const List<String> operadores = ["+", "-", "*", "/"];
    for (String char in inputPostFijo) {
      if (!operadores.contains(char)) {
        final Node nuevoNodo = Node(children: char, left: null, rigth: null);
        pilaNodos.add(nuevoNodo);
      } else {
        final Node hijoDerecho = pilaNodos.removeLast();
        final Node hijoIzq = pilaNodos.removeLast();
        final Node operadorPadre = Node(
          children: char,
          left: hijoIzq,
          rigth: hijoDerecho,
        );
        pilaNodos.add(operadorPadre);
      }
    }

    raiz = pilaNodos.removeLast();
  }

  double evaluarExpresion(Node nodo) {
    if (nodo.left == null && nodo.rigth == null) {
      return double.parse(nodo.children);
    }

    double izq = evaluarExpresion(nodo.left!);
    double der = evaluarExpresion(nodo.rigth!);

    switch (nodo.children) {
      case "+":
        return izq + der;

      case "-":
        return izq - der;

      case "*":
        return izq * der;

      case "/":
        if (der == 0) {
          throw Exception("No se puede dividir entre cero");
        }
        return izq / der;

      default:
        throw Exception("Operador desconocido: ${nodo.children}");
    }
  }
}

class CalculadoraLogica {
  static List<String> tokenizar(String input) {
    final List<String> tokens = [];

    for (String char in input.split('')) {
      tokens.add(char);
    }

    return tokens;
  }

  static List<String> convertirPostFija(List<String> tokens) {
    Queue<String> pilaOp = Queue();
    Queue<String> colaNumeros = Queue();

    Map<String, int> jerarquiaOp = {"+": 1, "-": 1, "/": 2, "*": 2};

    const List<String> operadores = ["+", "-", "/", "*"];

    for (var token in tokens) {
      if (operadores.contains(token)) {
        if (pilaOp.isEmpty) {
          pilaOp.add(token);
          continue;
        }
        while (pilaOp.isNotEmpty &&
            jerarquiaOp[pilaOp.last]! >= jerarquiaOp[token]!) {
          colaNumeros.add(pilaOp.removeLast());
        }
        pilaOp.add(token);
      } else {
        colaNumeros.add(token);
      }
    }
    if (pilaOp.isNotEmpty) {
      while (pilaOp.isNotEmpty) {
        colaNumeros.add(pilaOp.removeLast());
      }
    }
    return colaNumeros.toList();
  }

  static double obtenerResultado(String value) {
    final List<String> tokens = tokenizar(value);
    final List<String> valuePostFijo = convertirPostFija(tokens);
    print("arbol : ");
    final ArbolBinario arbolExpresiones = ArbolBinario();
    arbolExpresiones.insertar(valuePostFijo);
    return arbolExpresiones.evaluarExpresion(arbolExpresiones.raiz!);
  }
}
