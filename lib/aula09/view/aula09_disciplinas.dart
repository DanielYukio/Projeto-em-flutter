import 'package:flutter/material.dart';
import '../classes/disciplina.dart';

class Aula09Disciplinas extends StatelessWidget {
  const Aula09Disciplinas({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Disciplina> disciplinas = Disciplina.gerarDisciplinas();
    return ListView.builder(
      itemCount: disciplinas.length,
      itemBuilder: (context, index) => ListTile(
        leading: Text(disciplinas[index].codigo),
        title: Text(disciplinas[index].nome),
        subtitle: Text(disciplinas[index].professor),
      ),
    );
  }
}
