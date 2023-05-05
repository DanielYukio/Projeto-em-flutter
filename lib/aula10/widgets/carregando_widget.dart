import 'package:flutter/material.dart';

class CarregandoWidget extends StatelessWidget {
  const CarregandoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Carregando...'),
        SizedBox(height: 16),
        CircularProgressIndicator(),
      ],
    );
  }
}
