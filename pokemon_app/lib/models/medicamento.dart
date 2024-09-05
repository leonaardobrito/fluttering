// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicamento {
  final int recnum;
  final String descricao;
  final String uso;
  final int apresentacao_qtde;
  final String apresentacao_unimed;
  final int situacao;
  final bool apresentacao;
  final int apresentacao_unimed_qtde;

  Medicamento({
    required this.recnum,
    required this.descricao,
    required this.uso,
    required this.apresentacao_qtde,
    required this.apresentacao_unimed,
    required this.situacao,
    required this.apresentacao,
    required this.apresentacao_unimed_qtde,
  });

  Medicamento copyWith({
    int? recnum,
    String? descricao,
    String? uso,
    int? apresentacao_qtde,
    String? apresentacao_unimed,
    int? situacao,
    bool? apresentacao,
    int? apresentacao_unimed_qtde,
  }) {
    return Medicamento(
      recnum: recnum ?? this.recnum,
      descricao: descricao ?? this.descricao,
      uso: uso ?? this.uso,
      apresentacao_qtde: apresentacao_qtde ?? this.apresentacao_qtde,
      apresentacao_unimed: apresentacao_unimed ?? this.apresentacao_unimed,
      situacao: situacao ?? this.situacao,
      apresentacao: apresentacao ?? this.apresentacao,
      apresentacao_unimed_qtde: apresentacao_unimed_qtde ?? this.apresentacao_unimed_qtde,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recnum': recnum,
      'descricao': descricao,
      'uso': uso,
      'apresentacao_qtde': apresentacao_qtde,
      'apresentacao_unimed': apresentacao_unimed,
      'situacao': situacao,
      'apresentacao': apresentacao,
      'apresentacao_unimed_qtde': apresentacao_unimed_qtde,
    };
  }

  factory Medicamento.fromMap(Map<String, dynamic> map) {
    return Medicamento(
      recnum: map['recnum'] as int,
      descricao: map['descricao'] as String,
      uso: map['uso'] as String,
      apresentacao_qtde: map['apresentacao_qtde'] as int,
      apresentacao_unimed: map['apresentacao_unimed'] as String,
      situacao: map['situacao'] as int,
      apresentacao: map['apresentacao'] as bool,
      apresentacao_unimed_qtde: map['apresentacao_unimed_qtde'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicamento.fromJson(String source) => Medicamento.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicamento(recnum: $recnum, descricao: $descricao, uso: $uso, apresentacao_qtde: $apresentacao_qtde, apresentacao_unimed: $apresentacao_unimed, situacao: $situacao, apresentacao: $apresentacao, apresentacao_unimed_qtde: $apresentacao_unimed_qtde)';
  }

  @override
  bool operator ==(covariant Medicamento other) {
    if (identical(this, other)) return true;
  
    return 
      other.recnum == recnum &&
      other.descricao == descricao &&
      other.uso == uso &&
      other.apresentacao_qtde == apresentacao_qtde &&
      other.apresentacao_unimed == apresentacao_unimed &&
      other.situacao == situacao &&
      other.apresentacao == apresentacao &&
      other.apresentacao_unimed_qtde == apresentacao_unimed_qtde;
  }

  @override
  int get hashCode {
    return recnum.hashCode ^
      descricao.hashCode ^
      uso.hashCode ^
      apresentacao_qtde.hashCode ^
      apresentacao_unimed.hashCode ^
      situacao.hashCode ^
      apresentacao.hashCode ^
      apresentacao_unimed_qtde.hashCode;
  }
}
