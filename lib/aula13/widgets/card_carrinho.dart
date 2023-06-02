import 'package:flutter/material.dart';

class CardCarrinho extends StatelessWidget {
  final String nome;
  final double preco;

  const CardCarrinho({required this.nome, required this.preco, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            child: const Placeholder(),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nome,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(preco.toStringAsFixed(2)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
