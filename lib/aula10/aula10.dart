import 'package:flutter/material.dart';

class Aula10 extends StatefulWidget {
  const Aula10({super.key});

  @override
  State<Aula10> createState() => _Aula10State();
}

class _Aula10State extends State<Aula10> {
  var _loading = true;

  Future<void> loadContent() async {
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      _loading = false;
    });
  }

  Future<void> mensagemTardia() async {
    await Future.delayed(const Duration(seconds: 10));
    debugPrint('========= 10 Segundos se Passaram =========');
  }

  @override
  Widget build(BuildContext context) {
    loadContent();
    return Scaffold(
      body: Center(
        child: _loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Carregando...'),
                  SizedBox(height: 16),
                  CircularProgressIndicator(),
                ],
              )
            : const Text('O conteúdo foi carregado'),
      ),
    );
  }
}
