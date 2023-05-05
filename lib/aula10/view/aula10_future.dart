import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetobase/aula09/classes/disciplina.dart';
import 'package:projetobase/aula09/widgets/disciplina_card_dart.dart';
import 'package:projetobase/aula10/widgets/carregando_widget.dart';

class Aula10Future extends StatefulWidget {
  const Aula10Future({super.key});

  @override
  State<Aula10Future> createState() => _Aula10FutureState();
}

class _Aula10FutureState extends State<Aula10Future> {
  Future<String> carregarBoasVindas() async {
    await Future.delayed(const Duration(seconds: 5));
    // throw Exception('Deu Ruim');
    return 'Bem vindo ao Futuro.';
  }

  Future<List<Disciplina>> carregarDisciplinas() async {
    // var x = await fetch('\endpoing');
    // converter c em List<Disciplina>
    await Future.delayed(const Duration(seconds: 5));
    return Disciplina.gerarDisciplinas();
  }

  Widget _buildDisciplinas(
    BuildContext context,
    AsyncSnapshot<List<Disciplina>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return Text('Erro: ${snapshot.error.toString()}');
      }
      var disciplinas = snapshot.data as List<Disciplina>;
      return ListView.builder(
        itemCount: disciplinas.length,
        itemBuilder: (context, index) => DisciplinaCard(
          disciplina: disciplinas[index],
        ),
      );
    }
    return const CarregandoWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aula 10 Future')),
      body: Center(
        child: FutureBuilder(
          future: carregarDisciplinas(),
          builder: _buildDisciplinas,
        ),
      ),
    );
  }
}
