import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicamento.dart';

class MedicamentoApiService {
  final List<String> baseUrls = [
    'http://10.120.0.165:9502/medicamento',
  ];

  Future<Map<String, dynamic>> fetchMedicamentos(
    String descricao,
    int limit,
    int page,
  ) async {
    final baseUrl = baseUrls[0];

    try {
      final endpoint = (descricao.isEmpty)
          ? '$baseUrl/list?limit=$limit&page=$page'
          : '$baseUrl?descricao=$descricao&limit=$limit&page=$page';

      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));

        return {
          'medicamentos': data['data']
              .map<Medicamento>((item) => Medicamento.fromJson(item))
              .toList(),
          'pagination': data['_pagination']
        };
      } else {
        throw Exception('Falha ao carregar medicamentos da URL: $baseUrl.');
      }
    } catch (e) {
      throw Exception('Erro ao carregar medicamentos.');
    }
  }
}
