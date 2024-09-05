import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicamento.dart';

class MedicamentoApiService {
  final List<String> baseUrls = [
    'http://10.120.0.165:9502/',
  ];

  Future<List<Medicamento>> fetchMedicamentos(
      {int limit = 10, String? descricao}) async {
    final uri = descricao == null || descricao.isEmpty
        ? Uri.parse(baseUrls[0])
        : Uri.parse('${baseUrls[0]}busca?descricao=$descricao&tipo_busca=t');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Medicamento> medicamentos = [];

      if (data is List) {
        for (var medicamentoData in data) {
          medicamentos.add(Medicamento.fromJson(medicamentoData));
        }
      } else if (data is Map && data.containsKey('data')) {
        for (var result in data['data']) {
          medicamentos.add(Medicamento.fromJson(result));
        }
      }

      return medicamentos;
    } else {
      throw Exception('Falha ao carregar medicamentos.');
    }
  }
}


/* import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicamento.dart';

class MedicamentoApiService {
  // [turn the baseUrls into array]
  // final String baseUrl = 'https://pokeapi.co/api/v2';
  final String baseUrl = 'http://10.120.0.165:9502/';

  Future<List<Medicamento>> fetchMedicamentos(
      int limit, String descricao) async {
    final response = await http
        //.get(Uri.parse('$baseUrl/pokemon?offset=$offset&limit=$limit'));
        .get(Uri.parse('$baseUrl/busca?descricao=$descricao&tipo_busca=t'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Medicamento> medicamentos = [];

      for (var result in data['results']) {
        final medicamentoResponse = await http.get(Uri.parse(result['url']));
        final medicamentoData = json.decode(medicamentoResponse.body);
        medicamentos.add(Medicamento.fromJson(medicamentoData));
      }
      return medicamentos;
    } else {
      throw Exception('Falha ao carregar medicamentos.');
    }
  }
} */
