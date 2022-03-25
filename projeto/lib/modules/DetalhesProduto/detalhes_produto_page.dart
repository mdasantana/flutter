import 'package:flutter/material.dart';
import 'package:leitor_cbarra/data/produtos.dart';
import 'package:leitor_cbarra/widgets/detalhe_produto.dart';

class DetalhesProduto extends StatelessWidget {
  const DetalhesProduto({
    Key? key,
    required this.produto,
  }) : super(key: key);

  final Produtos produto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do produto'),
        backgroundColor: Color(0xFFF23827),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(produto.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Detalhe(
                          titulo: 'Código de Barras', valor: produto.cbarras),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Detalhe(
                        titulo: 'Nome',
                        valor: produto.nome,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Detalhe(
                        titulo: 'Categoria',
                        valor: produto.categoria,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Detalhe(
                            titulo: 'Data de compra',
                            valor: produto.dtCompra,
                          ),
                          Detalhe(
                            titulo: 'Data de vencimento',
                            valor: produto.dtVencimento,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Detalhe(
                            titulo: 'Quant. em estoque',
                            valor: produto.qntdEstoque.toString(),
                          ),
                          Detalhe(
                            titulo: 'Quant. mín estoque',
                            valor: produto.qntdMinEstoque.toString(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Detalhe(
                            titulo: 'Valor de compra',
                            valor: produto.vlrCompra.toString(),
                          ),
                          Detalhe(
                            titulo: 'Valor de venda',
                            valor: produto.vlrVenda.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
