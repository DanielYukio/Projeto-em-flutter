import 'package:projetobase/aula14/database/db_helper.dart';
import 'package:projetobase/aula14/model/aluno.dart';

class AlunoDAO {
  static Future<int> inserir(Aluno aluno) async {
    var db = await DBHelper.getInstance();
    int novoId = await db.insert('aluno', aluno.toMap());
    return novoId;
  }

  static Future<List<Aluno>> carregarAlunos() async {
    var db = await DBHelper.getInstance();
    var result = await db.query('aluno');
    var alunos = result.map((e) => Aluno.fromMap(e)).toList();
    return alunos;
  }

  static Future<int> deletarAluno(Aluno aluno) async {
    var db = await DBHelper.getInstance();
    var result =
        await db.delete('aluno', where: 'id = ?', whereArgs: [aluno.id]);
    return result;
  }
}
