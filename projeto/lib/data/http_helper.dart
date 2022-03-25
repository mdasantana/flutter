import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:leitor_cbarra/data/produtos.dart';

class HttpHelper {
  Future<Produtos> getProduto(String cBarras) async {
    Uri uri = Uri.parse(
        'https://us-central1-mdas-estoque-app.cloudfunctions.net/api/produtos/cbarras=$cBarras');
    var result = await http.get(uri);
    Map<String, dynamic> data =
        jsonDecode(result.body.substring(1, result.body.length - 1));
    Produtos produto = Produtos.fromJson(data["_fieldsProto"]);
    return produto;
  }

  Future<List<Produtos>> getProdutos() async {
    List<Produtos> produtos = [];
    // List<Map<String, dynamic>> listMapProdutos = [];
    Uri uri = Uri.parse(
        'https://us-central1-mdas-estoque-app.cloudfunctions.net/api/produtos');
    var result = await http.get(uri);
    List<dynamic> data = jsonDecode(result.body);
    data.forEach((element) {
      Produtos produto = Produtos.fromJson(element["_fieldsProto"]);
      produtos.add(produto);
    });
    // Produtos produto = Produtos.fromJson(data["_fieldsProto"]);
    return produtos;
  }
}
