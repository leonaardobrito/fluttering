import 'package:flutter/material.dart';
import 'package:medicamentapp/shared/widgets/loading_indicator.dart';
import 'package:medicamentapp/core/widgets/medicamento_app_bar.dart';
import 'package:medicamentapp/core/widgets/medicamento_tile.dart';
import 'package:medicamentapp/core/services/medicamento_api_service.dart';
import 'package:medicamentapp/features/medicamentos/models/medicamento.dart';

class MedicamentoListScreen extends StatefulWidget {
  const MedicamentoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicamentoListScreenState createState() => _MedicamentoListScreenState();
}

class _MedicamentoListScreenState extends State<MedicamentoListScreen> {
  final MedicamentoApiService _apiService = MedicamentoApiService();
  final List<Medicamento> _medicamentos = [];
  final ScrollController _scrollController = ScrollController();

  int _page = 1;
  final int _limit = 15;
  bool _isLoading = false;
  bool _hasMoreItems = true;
  String _searchQuery = '';

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

  Future<void> _fetchMedicamentos() async {
    if (_isLoading || !_hasMoreItems) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response =
          await _apiService.fetchMedicamentos(_searchQuery, _limit, _page);
      final novosMedicamentos = response['medicamentos'] as List<Medicamento>;
      final pagination = response['pagination'];

      if (!mounted) return;

      setState(() {
        _medicamentos.addAll(novosMedicamentos);
        _page++;
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
    const offsetParaChamadaApi = 100.0;

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - offsetParaChamadaApi &&
        !_isLoading &&
        _hasMoreItems) {
      _fetchMedicamentos();
    }
  }

  void _filterMedicamentos(String query) {
    if (query.length >= 3 || query.isEmpty) {
      setState(() {
        _searchQuery = query;
        _medicamentos.clear();
        _page = 1;
        _hasMoreItems = true;
      });
      _fetchMedicamentos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicamentoAppBar(onSearch: _filterMedicamentos),
      body: Container(
        color: const Color.fromARGB(223, 33, 59, 105),
        child: _buildMedicamentoList(),
      ),
    );
  }

  Widget _buildMedicamentoList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _medicamentos.length + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _medicamentos.length) {
          return const LoadingIndicator();
        }

        final medicamento = _medicamentos[index];
        return MedicamentoTile(
          medicamento: medicamento,
          onTap: () {
            Navigator.pushNamed(
              context,
              '/medicamentoDetail',
              arguments: medicamento,
            );
          },
        );
      },
    );
  }
}
