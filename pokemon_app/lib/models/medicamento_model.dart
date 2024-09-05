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


/* import 'package:flutter/material.dart';
import '../models/medicamento.dart';
import '../services/medicamento_api_service.dart';
import 'medicamento_detail_screen.dart';

class MedicamentoListScreen extends StatefulWidget {
  const MedicamentoListScreen({super.key});

  @override
  _MedicamentoListScreenState createState() => _MedicamentoListScreenState();
}

class _MedicamentoListScreenState extends State<MedicamentoListScreen> {
  final MedicamentoApiService _apiService = MedicamentoApiService();
  final List<Medicamento> _medicamentos = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMoreItems = true;
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMedicamentos();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Função para buscar medicamentos, considerando a paginação e a pesquisa
  Future<void> _fetchMedicamentos() async {
    if (_isLoading || !_hasMoreItems) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _apiService.fetchMedicamentos(15, _searchQuery, _page);

      final novosMedicamentos = response['medicamentos'] as List<Medicamento>;
      final pagination = response['pagination'];

      if (!mounted) return;

      setState(() {
        _medicamentos.addAll(novosMedicamentos);
        _page = pagination['nextPage'];
        _hasMoreItems = pagination['hasMoreItems'];
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar medicamentos: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent &&
        !_isLoading &&
        _hasMoreItems) {
      _fetchMedicamentos();
    }
  }

  // Função para filtrar medicamentos
  void _filterMedicamentos(String query) {
    setState(() {
      _searchQuery = query;
      _medicamentos.clear();  // Limpa a lista para carregar com a nova busca
      _page = 1;
      _hasMoreItems = true;  // Reseta a paginação
    });
    _fetchMedicamentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de medicamentos'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Pesquisar medicamentos',
                border: OutlineInputBorder(),
              ),
              onChanged: _filterMedicamentos,
            ),
          ),
        ),
      ),
      body: _buildMedicamentoList(),
    );
  }

  Widget _buildMedicamentoList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _medicamentos.length + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _medicamentos.length) {
          return const Center(child: CircularProgressIndicator());
        }

        final medicamento = _medicamentos[index];
        return ListTile(
          leading: Text(medicamento.uso),
          title: Text(medicamento.descricao.capitalize()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicamentoDetailScreen(
                  medicamento: medicamento,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
} */