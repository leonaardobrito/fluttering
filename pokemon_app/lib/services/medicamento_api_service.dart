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
    final baseUrl = baseUrls[0]; // para teste

    try {
      // provisório até ter a busca geral
      final endpoint = (descricao.isEmpty || descricao == '')
          ? '$baseUrl?descricao=di'
          : '$baseUrl?descricao=$descricao&limit=$limit&page=$page&tipo_busca=t';

      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return {
          'medicamentos': data
              .map<Medicamento>((item) => Medicamento.fromJson(item))
              .toList(),
          'pagination': {
            'nextPage': page + 1,
            'hasMoreItems': data.length == limit,
          }
        };
      } else {
        throw Exception('Falha ao carregar medicamentos da URL: $baseUrl.');
      }
    } catch (e) {
      print('Erro ao tentar $baseUrl: $e');
      throw Exception('Erro ao carregar medicamentos.');
    }
  }
}



/* import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicamento.dart';

class MedicamentoApiService {
  final List<String> baseUrls = [
    'http://10.120.0.165:9502/medicamento',
  ];

  Future<List<Medicamento>> fetchMedicamentos({
    required String descricao,
    required int limit,
    required int page,
  }) async {
    final baseUrl = baseUrls[0]; // para teste

    try {
      // Define o endpoint com base nos parâmetros 'descricao', 'limit', e 'page'
      final endpoint = descricao.isEmpty
          ? '$baseUrl?limit=$limit&page=$page' // Se não há descrição, busca todos os medicamentos com paginação
          : '$baseUrl?descricao=$descricao&limit=$limit&page=$page&tipo_busca=t'; // Caso haja descrição, realiza a busca

      // Faz a requisição GET
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        // Decodifica o corpo da resposta
        final data = json.decode(response.body);

        // Verifica se a resposta é uma lista
        if (data is List) {
          // Mapeia a lista de medicamentos e cria a lista de objetos `Medicamento`
          return data
              .map<Medicamento>((item) => Medicamento.fromJson(item))
              .toList();
        } else {
          throw Exception(
              'Formato de resposta inesperado. Esperado uma lista, mas recebido: $data');
        }
      } else {
        throw Exception(
            'Falha ao carregar medicamentos da URL: $baseUrl. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao tentar $baseUrl: $e');
      throw Exception('Erro ao carregar medicamentos.');
    }
  }
}



/* import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicamento.dart';

class MedicamentoApiService {
  final List<String> baseUrls = [
    'http://10.120.0.165:9502/medicamento',
  ];

  Future<Map<String, dynamic>> fetchMedicamentos(
      String descricao, int limit, int page) async {
    final endpoint = descricao.isEmpty
        // ? '${baseUrls[0]}?limit=$limit&page=$page'
        ? '${baseUrls[0]}?descricao=para&tipo_busca=t&limit=$limit&page=$page'
        : '${baseUrls[0]}?descricao=$descricao&tipo_busca=t&limit=$limit&page=$page';

    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return {
        'medicamentos': (data['data'] as List)
            .map((item) => Medicamento.fromJson(item))
            .toList(),
        'pagination': data['_pagination']
      };
    } else {
      throw Exception('Falha ao carregar medicamentos.');
    }
  }
} */

// sem paginação
/* import 'dart:convert';
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
} */


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
 */