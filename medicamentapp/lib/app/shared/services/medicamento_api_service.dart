/* import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../features/medicamentos/models/medicamento.dart';

class MedicamentoApiService {
  final String baseUrl = 'https://api.olostech.com/medicamento';
  Future<Map<String, dynamic>> fetchMedicamentos(
    String descricao,
    int limit,
    int page,
  ) async {
    try {
      final endpoint = (descricao.isEmpty)
          ? '$baseUrl/list?limit=$limit&page=$page'
          : '$baseUrl?descricao=$descricao&limit=$limit&page=$page';

      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));

        if (data != null && data['data'] != null) {
          final medicamentos = (data['data'] as List)
              .map<Medicamento>((item) => Medicamento.fromJson(item))
              .toList();

          return {
            'medicamentos': medicamentos,
            'pagination': data['_pagination'] ?? {},
          };
        } else {
          throw Exception('Formato de dados inesperado da API.');
        }
      } else {
        throw Exception(
            'Falha ao carregar medicamentos. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao carregar medicamentos: $e');
    }
  }
} */

import '../../modules/medicamentos/models/medicamento.dart';

class MedicamentoApiService {
  Future<Map<String, dynamic>> fetchMedicamentos(
    String descricao,
    int limit,
    int page,
  ) async {
    // Simulando um atraso de requisição
    await Future.delayed(const Duration(seconds: 1));

    // Dados simulados de medicamentos
    List<Medicamento> medicamentosSimulados = [
      Medicamento(
        recnum: 1,
        descricao: 'Paracetamol 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 20,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 2,
        descricao: 'Dipirona 1g',
        uso: 'Uso Oral',
        apresentacaoQtde: 10,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Blister',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 3,
        descricao: 'Ibuprofeno 600mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 30,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 4,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 5,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 6,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 7,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 8,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 9,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 10,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 11,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 12,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 13,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 14,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 15,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 16,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 17,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 18,
        descricao: 'Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 19,
        descricao: '19 Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 20,
        descricao: '19 Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 21,
        descricao: '19 Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 22,
        descricao: '19 Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 23,
        descricao: '19 Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 24,
        descricao: '19 Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
      Medicamento(
        recnum: 25,
        descricao: '25 Amoxicilina 500mg',
        uso: 'Uso Oral',
        apresentacaoQtde: 21,
        apresentacaoUnimed: 'Comprimidos',
        situacao: 1,
        apresentacao: 'Cartela',
        apresentacaoUnimedQtde: 1,
      ),
    ];

    // Filtrando medicamentos pela descrição
    if (descricao.isNotEmpty) {
      medicamentosSimulados = medicamentosSimulados
          .where((medicamento) => medicamento.descricao
              .toLowerCase()
              .contains(descricao.toLowerCase()))
          .toList();
    }

    // Implementando paginação manualmente
    int startIndex = (page - 1) * limit;
    int endIndex = startIndex + limit;

    // Verifica se o índice final excede o tamanho da lista
    List<Medicamento> medicamentosPaginados = medicamentosSimulados.sublist(
      startIndex,
      endIndex > medicamentosSimulados.length
          ? medicamentosSimulados.length
          : endIndex,
    );

    // Simulação da resposta de paginação
    return {
      'medicamentos': medicamentosPaginados,
      'pagination': {
        'currentPage': page,
        'totalItems': medicamentosSimulados.length,
        'totalPages': (medicamentosSimulados.length / limit).ceil(),
        'hasMoreItems': endIndex < medicamentosSimulados.length,
      }
    };
  }
}
