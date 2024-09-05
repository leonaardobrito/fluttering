import 'dart:convert';

class MedicamentoModel {
  final int totalItems;
  final int page;
  final int lastPage;
  final int nextPage;
  final int limit;
  final bool hasMoreItems;


  MedicamentoModel({
    required this.totalItems,
    required this.page,
    required this.lastPage,
    required this.nextPage,
    required this.limit,
    required this.hasMoreItems,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalItems': totalItems,
      'page': page,
      'lastPage': lastPage,
      'nextPage': nextPage,
      'limit': limit,
      'hasMoreItems': hasMoreItems,
    };
  }

  factory MedicamentoModel.fromMap(Map<String, dynamic> map) {
    return MedicamentoModel(
      totalItems: map['totalItems'] ?? 0,
      page: map['page'] ?? 0,
      lastPage: map['lastPage'] ?? 0,
      nextPage: map['nextPage'] ?? 0,
      limit: map['limit'] ?? 0,
      hasMoreItems: map['hasMoreItems'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicamentoModel.fromJson(String source) =>
      MedicamentoModel.fromMap(json.decode(source));
}
