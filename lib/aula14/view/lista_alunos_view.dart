import 'package:flutter/material.dart';
import 'package:projetobase/aula14/model/aluno.dart';
import 'package:projetobase/aula14/model/aluno_dao.dart';
import 'package:projetobase/aula14/widgets/aluno_tile.dart';

class ListaAlunosView extends StatefulWidget {
  const ListaAlunosView({super.key});

  @override
  State<ListaAlunosView> createState() => _ListaAlunosViewState();
}

class _ListaAlunosViewState extends State<ListaAlunosView> {
  var _matriculaController = TextEditingController();
  var _nomeController = TextEditingController();
  int? id;

  Future<void> _salvarAluno() async {
    if (id == null) {
      // Validar campos
      // TextFormmField - Suporta Validação
      var aluno = Aluno(
        matricula: _matriculaController.text,
        nome: _nomeController.text,
      );
      var novoId = await AlunoDAO.inserir(aluno);
      debugPrint('Aluno inserido com id: $novoId');
      _matriculaController.clear();
      _nomeController.clear();
      setState(() => {});
    }
  }

  Future<void> _deletarAluno(Aluno aluno) async {
    await AlunoDAO.deletarAluno(aluno);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextField(
                    controller: _matriculaController,
                    decoration: const InputDecoration(
                      label: Text('Matricula'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FloatingActionButton(
                    onPressed: _salvarAluno,
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          FutureBuilder(
            future: AlunoDAO.carregarAlunos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('Houve um Erro: ${snapshot.error}'));
              }
              var alunos = snapshot.data as List<Aluno>;
              if (alunos.isEmpty) {
                return const Center(
                  child: Text('Nenhum aluno Salvo'),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: alunos.length,
                itemBuilder: (context, index) => AlunoTile(
                  aluno: alunos[index],
                  editAction: () {},
                  deleteAction: () => _deletarAluno(alunos[index]),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
