class Calculate {
  String calculadora(String expressao) {
    String resultado = "";
    List<num> listaNumeros = [];
    List<String> listaOperadores = [];

    listaNumeros = _obterNumeros(expressao);
    listaOperadores = _obterOperadores(expressao);

    resultado = _calcularValor(listaNumeros, listaOperadores);
    return resultado;
  }

  String _calcularValor(List<num> listaNumeros, List<String> listaOperadores) {
    num total = 0;
    String resultado = "";
    int j = 0;
    for (int i = 0; i < listaNumeros.length-1; i++) {
      if (total == 0) {
        num numeroUm = listaNumeros[i];
        num numeroDois = listaNumeros[i + 1];
        String operador = listaOperadores[i];
        total = _executarOperacao(numeroUm, operador, numeroDois);
      } else if (total > 0) {
        num numeroDois = listaNumeros[i + 1];
        String operador = listaOperadores[j + 1];
        total = _executarOperacao(total, operador, numeroDois);
        j++;
      }
    }
    resultado = "" + total.toString();
    return resultado;
  }

  num _executarOperacao(num numeroUm, String operador, num numeroDois) {
    num resultado = 0;
    if (operador == "+") {
      resultado = numeroUm + numeroDois;
    } else if (operador == "-") {
      resultado = numeroUm - numeroDois;
    } else if (operador == "/") {
      resultado = numeroUm / numeroDois;
    } else if (operador == "*") {
      resultado = numeroUm * numeroDois;
    }
    return resultado;
  }

  List<num> _obterNumeros(String expressao) {
    List<num> listaNumeros = [];
    String numeroEmString = "";
    for (int i = 0; i < expressao.length; i++) {
      if (_isOperador(expressao[i])) {
        num numero = num.parse(numeroEmString);
        listaNumeros.add(numero);
        numeroEmString = "";
      } else {
        numeroEmString += ("" + expressao[i]);
      }
    }
    if (numeroEmString.isNotEmpty) {
      num numero = num.parse(numeroEmString);
      listaNumeros.add(numero);
    }
    return listaNumeros;
  }

  List<String> _obterOperadores(String expressao) {
    List<String> listaOperadores = <String>[];
    for (int i = 0; i < expressao.length; i++) {
      if (_isOperador(expressao[i])) {
        listaOperadores.add(expressao[i]);
      }
    }
    return listaOperadores;
  }

  bool _isOperador(String caracter) {
    bool isOperator = false;
    if (caracter == "-" ||
        caracter == "+" ||
        caracter == "/" ||
        caracter == "*") {
      isOperator = true;
    }
    return isOperator;
  }
}
