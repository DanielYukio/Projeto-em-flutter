import 'package:flutter/material.dart';
import 'package:projetobase/aula09/classes/disciplina.dart';

class DisciplinaCard extends StatelessWidget {
  const DisciplinaCard({super.key, required this.disciplina});

  final Disciplina disciplina;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 8,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.blue),
              child: SizedBox(
                width: MediaQuery.of(context).size.height,
                height: 20,
                child: Center(
                  child: Text(
                    disciplina.codigo,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Text(
              disciplina.nome,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(disciplina.professor),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
