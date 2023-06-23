import 'package:flutter/material.dart';
import 'package:projetobase/aula12/model/carrinho_model.dart';
import 'package:projetobase/aula13/widgets/card_carrinho.dart';
import 'package:provider/provider.dart';

class PedidoView extends StatelessWidget {
  const PedidoView({super.key});

  @override
  Widget build(BuildContext context) {
    var carrinho = context.watch<CarrinhoModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
        backgroundColor: Colors.limeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: carrinho.numProdutos,
              itemBuilder: (context, index) {
                var produto = carrinho.produtos[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: CardCarrinho(
                    nome: produto.nome,
                    preco: produto.preco,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Total'),
                const SizedBox(width: 8),
                Text('R\$ ${carrinho.valorTotal}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
