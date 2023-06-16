import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:projetobase/aula12/model/carrinho_model.dart';
import 'package:projetobase/aula12/model/produto.dart';
import 'package:provider/provider.dart';

final List<Produto> produtos = Produto.gerarLista();

class CardapioView extends StatelessWidget {
  const CardapioView({super.key});

  @override
  Widget build(BuildContext context) {
    var carrinho = context.watch<CarrinhoModel>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                if (carrinho.numProdutos > 0) {
                  Navigator.pushNamed(context, '/pedidos');
                }
              },
              child: badge.Badge(
                badgeStyle: const badge.BadgeStyle(badgeColor: Colors.green),
                showBadge: carrinho.numProdutos > 0,
                badgeContent: Text('${carrinho.numProdutos}'),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(produtos[index].nome),
            subtitle: Text('R\$ ${produtos[index].preco.toStringAsFixed(2)}'),
            trailing: Padding(
              padding: const EdgeInsets.all(8),
              child: carrinho.isAdicionado(produtos[index])
                  ? IconButton(
                      onPressed: () {
                        carrinho.remover(produtos[index]);
                      },
                      icon: const Icon(Icons.delete),
                    )
                  : IconButton(
                      onPressed: () {
                        carrinho.adicionar(produtos[index]);
                      },
                      icon: const Icon(Icons.add, color: Colors.green),
                    ),
            ),
          );
        },
      ),
    );
  }
}
