class Disciplina {
  late final String codigo;
  late final String nome;
  late final String professor;

  Disciplina({
    required this.codigo,
    required this.nome,
    required this.professor,
  });

  static List<Disciplina> gerarDisciplinas() {
    return [
      Disciplina(
        codigo: 'PDMDE',
        nome: 'Programação para Disp. Móveis',
        professor: 'Dourado',
      ),
      Disciplina(
        codigo: 'PDMDE',
        nome: 'Programação para Disp. Móveis',
        professor: 'Dourado',
      ),
      Disciplina(
        codigo: 'PDMDE',
        nome: 'Programação para Disp. Móveis',
        professor: 'Dourado',
      ),
      Disciplina(
        codigo: 'PDMDE',
        nome: 'Programação para Disp. Móveis',
        professor: 'Dourado',
      ),
      Disciplina(
        codigo: 'PDMDE',
        nome: 'Programação para Disp. Móveis',
        professor: 'Dourado',
      ),
    ];
  }
}
