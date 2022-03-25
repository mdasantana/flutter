class Produtos {
  String cbarras = '';
  String nome = '';
  String imageUrl = '';
  String categoria = '';
  int qntdEstoque = 0;
  int qntdMinEstoque = 0;
  String dtCompra = '';
  String dtVencimento = '';
  double vlrCompra = 0;
  double vlrVenda = 0;

  Produtos(
      this.cbarras,
      this.nome,
      this.categoria,
      this.imageUrl,
      this.qntdEstoque,
      this.qntdMinEstoque,
      this.dtCompra,
      this.dtVencimento,
      this.vlrCompra,
      this.vlrVenda);

  Produtos.fromJson(Map<String, dynamic> produtoMap) {
    this.cbarras = (produtoMap['cbarras']['stringValue']);
    this.nome = (produtoMap['nome']['stringValue']);
    this.categoria = (produtoMap['categoria']['stringValue']);
    this.imageUrl = (produtoMap['imageUrl']['stringValue']) == ''
        ?
        'https://gaprastore.com/wp-content/uploads/2021/07/2219706_6750b45123f23a1fa046fe220b8b6856.jpg'
        : (produtoMap['imageUrl']['stringValue']);
    this.qntdEstoque = int.parse(produtoMap['qntdEstoque']['integerValue']);
    this.qntdMinEstoque = int.parse(produtoMap['qntdMinEstoque']['integerValue']);
    this.dtCompra = (produtoMap['dtCompra']['stringValue']) ?? '';
    this.dtVencimento = (produtoMap['dtVencimento']['stringValue'] ?? '');
    this.vlrCompra = (produtoMap['VlrCompra']['doubleValue']) ?? 0;
    this.vlrVenda = (produtoMap['VlrVenda']['doubleValue'] ?? 0);
  }
}
