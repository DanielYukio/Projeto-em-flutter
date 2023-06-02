class Produto {
  late int id;
  late String nome;
  late double preco;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
  });

  static List<Produto> gerarLista() {
    return [
      Produto(id: 1, nome: 'Produto 1', preco: 16.50),
      Produto(id: 2, nome: 'Produto 2', preco: 17.50),
      Produto(id: 3, nome: 'Produto 3', preco: 13.50),
      Produto(id: 4, nome: 'Produto 4', preco: 11.50),
      Produto(id: 5, nome: 'Produto 5', preco: 17.50),
      Produto(id: 6, nome: 'Produto 6', preco: 159.50),
      Produto(id: 7, nome: 'Produto 7', preco: 156.50),
      Produto(id: 8, nome: 'Produto 8', preco: 154.50),
      Produto(id: 9, nome: 'Produto 9', preco: 125.50),
      Produto(id: 10, nome: 'Produto 10', preco: 105.50),
    ];
  }
}
