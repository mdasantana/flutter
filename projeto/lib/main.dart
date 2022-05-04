import 'package:calculator/data/buttons.data.dart';
import 'package:flutter/material.dart';

import 'controllers/calculator.controler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
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
  ButtonsProvider buttonsProvider = ButtonsProvider();
  List<Map<String, dynamic>> _botoes = [];
  String _descOperacao = "";
  String? _resultado;
  TextEditingController _inputController = new TextEditingController();

  @override
  void initState() {
    _botoes = buttonsProvider.botoes;
    super.initState();
  }

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
                  color: Colors.lightGreenAccent.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextField(
                            controller: _inputController,
                            maxLines: 1,
                            keyboardType: TextInputType.none,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Digital 7',
                              fontSize: 56,
                              fontStyle: FontStyle.normal,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 16.0,
                              ),
                            ),
                            autofocus: true,
                            cursorHeight: 40.0,
                            cursorWidth: 2.0,
                            cursorColor: Colors.orange[700],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextoCalculadora(
                            texto:
                                _resultado == null ? "" : _resultado.toString(),
                            color: Colors.black,
                            fontSize: 48,
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
                            TextoCalculadora(
                              texto: _descOperacao,
                              color: Colors.black,
                              fontSize: 24,
                            ),
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
                  primary: false,
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(
                    _botoes.length,
                    (index) => GestureDetector(
                      onTap: () {
                        switch (_botoes[index]["action"]) {
                          case "CLEAR_ALL":
                            setState(() {
                              _inputController.text = "";
                              _descOperacao = "CLEAR";
                              _resultado = "";
                            });
                            break;
                          case "CLEAR":
                            if (_inputController.text.isNotEmpty)
                              _inputController.text = _inputController.text
                                  .substring(
                                      0, _inputController.text.length - 1);
                            break;
                          case "ADD":
                            setState(() {
                              _descOperacao = "ADD";
                              _inputController.text =
                                  _inputController.text + "+";
                            });
                            break;
                          case "PERCENT":
                            setState(() {
                              _descOperacao = "PERCENT";
                            });
                            break;
                          case "DIVIDE":
                            setState(() {
                              _descOperacao = "DIVIDE";
                              _inputController.text =
                                  _inputController.text + "/";
                            });
                            break;
                          case "MULTIPLY":
                            setState(() {
                              _descOperacao = "MULTIPLY";
                              _inputController.text =
                                  _inputController.text + "*";
                            });
                            break;
                          case "SUBTRACT":
                            setState(() {
                              _descOperacao = "SUBTRACT";
                              _inputController.text =
                                  _inputController.text + "-";
                            });
                            break;
                          case "OPERATE":
                            setState(() {
                              _resultado = Calculate()
                                  .calculadora(_inputController.text)
                                  .toString();
                              _descOperacao = "RESULT";
                            });
                            break;
                          case "REVERSE_SIGNAL":
                            break;
                          default:
                            _inputController.text += _botoes[index]["value"];
                            break;
                        }
                      },
                      child: BotaoCalculadora(
                        botao: _botoes[index],
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

class BotaoCalculadora extends StatelessWidget {
  const BotaoCalculadora({
    Key? key,
    required Map<String, dynamic> botao,
  })  : _botao = botao,
        super(key: key);

  final Map<String, dynamic> _botao;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black87,
        border: Border.all(
          color: Colors.black,
          width: 5,
        ),
      ),
      child: Center(
        child: _botao["isIcon"]
            ? Icon(
                _botao["value"],
                color: _botao["color"],
                size: 32,
              )
            : TextoCalculadora(
                texto: _botao["value"], fontSize: 32, color: _botao["color"]),
      ),
    );
  }
}

class TextoCalculadora extends StatelessWidget {
  const TextoCalculadora({
    Key? key,
    required String texto,
    required Color color,
    required double fontSize,
  })  : _texto = texto,
        _color = color,
        _fontSize = fontSize,
        super(key: key);

  final String _texto;
  final Color _color;
  final double _fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_texto",
      style: TextStyle(
        color: _color,
        fontFamily: 'Digital 7',
        fontSize: _fontSize,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
