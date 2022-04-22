import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _descOperacao = "";
  String _valorDigitado = "0";
  num? _primeiroOperando;
  num? _segundoOperando;

  final List<String> _textoBotoes = [
    "A/C",
    "-/+",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "="
  ];
  final List<String> _simbolos = [
    "A/C",
    "-/+",
    "%",
    "÷",
    "*",
    "-",
    "+",
    ".",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .30,
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$_valorDigitado",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Digital 7',
                              fontSize: 56,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_right_rounded,
                              color: Colors.black,
                              size: 32,
                            ),
                            Text(
                              "$_descOperacao",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Digital 7',
                                fontSize: 24,
                                fontStyle: FontStyle.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .6,
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(
                    _textoBotoes.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black87,
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              switch (_textoBotoes[index]) {
                                case "+":
                                  _descOperacao = "ADD";
                                  break;
                                case "-":
                                  _descOperacao = "SUBTRACTION";
                                  break;
                                case "*":
                                  _descOperacao = "MULTIPLICATION";
                                  break;
                                case "÷":
                                  _descOperacao = "DIVISION";
                                  break;
                                default:
                              }
                              _valorDigitado = _valorDigitado == "0"
                                  ? _textoBotoes[index]
                                  : _valorDigitado + _textoBotoes[index];
                            });
                          },
                          child: Text(
                            "${_textoBotoes[index]}",
                            style: TextStyle(
                              color: _simbolos.contains(_textoBotoes[index])
                                  ? Colors.orange[700]
                                  : Colors.white70,
                              fontFamily: 'Digital 7',
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
