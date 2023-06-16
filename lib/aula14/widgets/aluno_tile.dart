import 'package:flutter/material.dart';
import 'package:projetobase/aula14/model/aluno.dart';

class AlunoTile extends StatelessWidget {
  const AlunoTile({
    super.key,
    required this.aluno,
    required this.editAction,
    required this.deleteAction,
  });

  final Aluno aluno;
  final VoidCallback editAction;
  final VoidCallback deleteAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(aluno.nome),
      subtitle: Text(aluno.matricula),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: editAction,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: deleteAction,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
