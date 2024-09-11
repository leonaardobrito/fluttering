class Medicamento {
  final int recnum;
  final String descricao;
  final String uso;
  final int apresentacaoQtde;
  final String apresentacaoUnimed;
  final int situacao;
  final String? apresentacao;
  final int apresentacaoUnimedQtde;

  Medicamento({
    required this.recnum,
    required this.descricao,
    required this.uso,
    required this.apresentacaoQtde,
    required this.apresentacaoUnimed,
    required this.situacao,
    this.apresentacao,
    required this.apresentacaoUnimedQtde,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      recnum: _parseToInt(json['recnum']),
      descricao: json['descricao'],
      uso: json['uso'],
      apresentacaoQtde: _parseToInt(json['apresentacao_qtde']),
      apresentacaoUnimed: json['apresentacao_unimed'],
      situacao: _parseToInt(json['situacao']),
      apresentacao: json['apresentacao'],
      apresentacaoUnimedQtde: _parseToInt(json['apresentacao_unimed_qtde']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recnum': recnum,
      'descricao': descricao,
      'uso': uso,
      'apresentacao_qtde': apresentacaoQtde,
      'apresentacao_unimed': apresentacaoUnimed,
      'situacao': situacao,
      'apresentacao': apresentacao,
      'apresentacao_unimed_qtde': apresentacaoUnimedQtde,
    };
  }

  static int _parseToInt(dynamic value) {
    if (value is String) {
      return int.tryParse(value) ?? 0;
    } else if (value is num) {
      return value.toInt();
    } else {
      return 0; // caso nao consiga converter, usa 0 como default.
    }
  }
}
