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
        codigo: 'AGRD5',
        nome: 'Administração e Gerenciamento de Redes',
        professor: 'Newton Mitsushigue Kamimura',
      ),
      Disciplina(
        codigo: 'CBGD5',
        nome: 'Contabilidade Básica e Gestão Financeira',
        professor: 'Eline Gomes de Oliveira Zioli',
      ),
      Disciplina(
        codigo: 'GPRD5',
        nome: 'Gestão de Projetos',
        professor: 'Luiz Egídio Costa Cunha',
      ),
      Disciplina(
        codigo: 'PDMDE',
        nome: 'Programação p/ Dispositivos. Móveis',
        professor: 'Antônio Miguel Batista Dourado',
      ),
      Disciplina(
        codigo: 'PL1D5',
        nome: 'Projeto Integrado I',
        professor: 'Giorjety Licorini Dias',
      ),
      Disciplina(
        codigo: 'TP2D5',
        nome: 'Técnicas de Programação II',
        professor: 'Felipe Alexandre Cardoso Pazinato',
      ),
    ];
  }
}
