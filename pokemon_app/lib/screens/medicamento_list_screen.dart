import 'package:flutter/material.dart';
import 'package:pokemon_app/models/medicamento.dart';
import 'package:pokemon_app/screens/medicamento_detail_screen.dart';
import 'package:pokemon_app/services/medicamento_api_service.dart';

class MedicamentoListScreen extends StatefulWidget {
  const MedicamentoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicamentoListScreenState createState() => _MedicamentoListScreenState();
}

class _MedicamentoListScreenState extends State<MedicamentoListScreen> {
  final MedicamentoApiService _apiService = MedicamentoApiService();
  final List<Medicamento> _medicamentos = [];
  String _searchQuery = '';
  bool _isLoading = false;
  final int _limit = 10;
  final ScrollController _scrollController = ScrollController();
  bool _hasMoreItems = true;

  @override
  void initState() {
    super.initState();
    _fetchMedicamentos(); // Inicia a busca
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchMedicamentos() async {
    if (_isLoading || !_hasMoreItems) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final novosMedicamentos = await _apiService.fetchMedicamentos(
        limit: _limit,
        descricao: _searchQuery.isEmpty ? null : _searchQuery,
      );

      if (!mounted) return;

      if (novosMedicamentos.isEmpty) {
        setState(() {
          _hasMoreItems = false;
        });
      } else {
        setState(() {
          _medicamentos.addAll(novosMedicamentos);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao carregar medicamentos: $e')),
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
      _fetchMedicamentos(); // Carregar mais medicamentos ao alcançar o final
    }
  }

  void _filterMedicamentos(String query) {
    setState(() {
      _searchQuery = query;
      _medicamentos.clear(); // Limpa os medicamentos ao realizar uma nova busca
      _hasMoreItems = true;
    });
    _fetchMedicamentos(); // Refaz a busca com a nova query
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Medicamentos'),
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
              onChanged: _filterMedicamentos, // Aciona a busca ao digitar
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
          return const Center(
              child: CircularProgressIndicator()); // Indicador de carregamento
        }

        final medicamento = _medicamentos[index];
        return ListTile(
          leading: Text(medicamento.uso),
          title: Text(medicamento.descricao.capitalize()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MedicamentoDetailScreen(medicamento: medicamento),
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
}
