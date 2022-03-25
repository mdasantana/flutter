import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:leitor_cbarra/data/http_helper.dart';
import 'package:leitor_cbarra/data/produtos.dart';
import 'package:leitor_cbarra/modules/DetalhesProduto/detalhes_produto_page.dart';
import 'package:leitor_cbarra/modules/ListaProdutos/lista_produtos_page.dart';
import 'package:leitor_cbarra/services/auth_service.dart';
import 'package:provider/src/provider.dart';

class CodeReadingPage extends StatefulWidget {
  CodeReadingPage({Key? key}) : super(key: key);

  @override
  _CodeReadingPageState createState() => _CodeReadingPageState();
}

class _CodeReadingPageState extends State<CodeReadingPage> {
  String codeMaterial = '';
  bool inLogOut = false;
  bool inSearch = false;
  Produtos produto = Produtos('', '', '', '', 0, 0, '', '', 0, 0);

  logout() async {
    setState(() => inLogOut = true);
    try {
      await context.read<AuthService>().logout();
    } on AuthException catch (e) {
      setState(() => inLogOut = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.menssagem),
        ),
      );
    }
  }

  noFound() {
    setState(() {
      inSearch = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao localizar produto'),
      ),
    );
  }

  foundProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesProduto(
          produto: produto,
        ),
      ),
    );
    setState(() {
      inSearch = false;
    });
  }

  readQRCode() async {
    try {
      String code = await FlutterBarcodeScanner.scanBarcode(
        '#F23827',
        'Cancelar',
        false,
        ScanMode.BARCODE,
      );
      if (code != '-1') {
        codeMaterial = code;
        setState(() {
          inSearch = true;
        });
        HttpHelper helper = HttpHelper();
        produto = await helper.getProduto(codeMaterial);
        produto.cbarras != '' ? foundProduct() : noFound();
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Produtos',
          style: TextStyle(fontSize: 22.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Color(0xFFF23827),
      ),
      body: Center(
        child: inLogOut || inSearch
            ? SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  color: Color(0xFFF23827),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: readQRCode,
                    icon: Icon(
                      Icons.qr_code_2,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Buscar produto',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.red[300],
                      primary: Color(0xFFF23827),
                      minimumSize: Size(100, 56),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4.0),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        inSearch = true;
                      });
                      HttpHelper helper = HttpHelper();
                      List<Produtos> produtos = await helper.getProdutos();
                      if (produtos.isNotEmpty) {
                        setState(() {
                          inSearch = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListaProdutos(
                                    produtos: produtos,
                                  )),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.list_alt,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Listar produtos',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.red[300],
                      primary: Color(0xFFF23827),
                      minimumSize: Size(100, 56),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4.0),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
