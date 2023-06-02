import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:projetobase/aula12/model/produto.dart';

class CarrinhoModel extends ChangeNotifier {
  final List<Produto> _lista = [];

  UnmodifiableListView<Produto> get produtos => UnmodifiableListView(_lista);

  int get numProdutos => _lista.length;

  double get valorTotal {
    double valor = 0;

    for (var produto in _lista) {
      valor += produto.preco;
    }

    return valor;
  }

  void adicionar(Produto p) {
    _lista.add(p);
    notifyListeners();
  }

  void remover(Produto p) {
    _lista.remove(p);
    notifyListeners();
  }

  bool isAdicionado(Produto p) {
    return _lista.any((prod) => prod.id == p.id);
  }
}
