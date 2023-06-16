// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Aluno {
  final int? id;
  final String matricula;
  final String nome;

  Aluno({
    this.id,
    required this.matricula,
    required this.nome,
  });

  Aluno copyWith({
    int? id,
    String? matricula,
    String? nome,
  }) {
    return Aluno(
      id: id ?? this.id,
      matricula: matricula ?? this.matricula,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'matricula': matricula,
      'nome': nome,
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] != null ? map['id'] as int : null,
      matricula: map['matricula'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) =>
      Aluno.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Aluno(id: $id, matricula: $matricula, nome: $nome)';

  @override
  bool operator ==(covariant Aluno other) {
    if (identical(this, other)) return true;

    return other.id == id && other.matricula == matricula && other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ matricula.hashCode ^ nome.hashCode;
}
