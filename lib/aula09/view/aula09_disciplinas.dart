import 'package:flutter/material.dart';
import 'package:projetobase/aula09/widgets/disciplina_card_dart.dart';
import '../classes/disciplina.dart';

class Aula09Disciplinas extends StatelessWidget {
  const Aula09Disciplinas({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Disciplina> disciplinas = Disciplina.gerarDisciplinas();

    return ListView.builder(
      itemCount: disciplinas.length,
      itemBuilder: (context, index) => DisciplinaCard(
        disciplina: disciplinas[index],
      ),
    );
  }
}
