import 'package:flutter/material.dart';
import 'package:leitor_cbarra/data/produtos.dart';
import 'package:leitor_cbarra/modules/DetalhesProduto/detalhes_produto_page.dart';

class ListaProdutos extends StatelessWidget {
  const ListaProdutos({
    Key? key,
    required this.produtos,
  }) : super(key: key);

  final List<Produtos> produtos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos em estoque'),
        backgroundColor: Color(0xFFF23827),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: produtos.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 4.0,
                color: Colors.black45,
              ),
          itemBuilder: (BuildContext context, int index) {
            return DetalhesLista(
              produto: produtos[index],
            );
          }),
    );
  }
}

class DetalhesLista extends StatelessWidget {
  const DetalhesLista({
    Key? key,
    required this.produto,
  }) : super(key: key);

  final Produtos produto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesProduto(
              produto: produto,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 80.0,
                height: 110.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(produto.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                  Text(
                    produto.cbarras,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                  Text(
                    'Estoque: ${produto.qntdEstoque}',
                    style: TextStyle(fontSize: 14.0),
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
