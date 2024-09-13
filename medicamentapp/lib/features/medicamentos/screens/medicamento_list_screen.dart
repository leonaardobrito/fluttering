import 'package:flutter/material.dart';
import 'package:medicamentapp/core/widgets/medicamento_app_bar.dart';
import 'package:medicamentapp/core/widgets/medicamento_tile.dart';
import 'package:medicamentapp/shared/widgets/loading_indicator.dart';
import 'package:medicamentapp/core/services/medicamento_api_service.dart';
import 'package:medicamentapp/features/medicamentos/models/medicamento.dart';

class MedicamentoListScreen extends StatefulWidget {
  const MedicamentoListScreen({super.key});

  @override
  MedicamentoListScreenState createState() => MedicamentoListScreenState();
}

class MedicamentoListScreenState extends State<MedicamentoListScreen> {
  final MedicamentoApiService _apiService = MedicamentoApiService();
  final List<Medicamento> _medicamentos = [];
  int _page = 1;
  late int _limit;
  bool _isLoading = false;
  bool _hasMoreItems = true;
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // função chamada IMEDIATAMENTE após initState()
    // calcula após o contexto ficar disponível
    _limit = _calculateLimit();
    _fetchMedicamentos();
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
      print('Total de medicamentos recebidos: ${_medicamentos.length}');
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
    final offsetParaChamadaApi = MediaQuery.of(context).size.height * 0.2;

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - offsetParaChamadaApi &&
        !_isLoading &&
        _hasMoreItems) {
      _fetchMedicamentos();
    }
  }

  void _filterMedicamentos(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchQuery = '';
        _medicamentos.clear();
        _page = 1;
        _hasMoreItems = true;
        _limit = _calculateLimit(); // recalcula lim. com base no screensize
      });
    } else if (query.length >= 3) {
      setState(() {
        _searchQuery = query;
        _medicamentos.clear();
        _page = 1;
        _hasMoreItems = true;
        _limit = _calculateLimit();
      });
    }
    _fetchMedicamentos();
  }

  // calcula qtos itens devem ser carregados com base na altura da tela atual
  int _calculateLimit() {
    final screenHeight = MediaQuery.of(context).size.height;
    const tileHeight = 40.0;
    return (screenHeight / tileHeight).floor(); // qtos tiles cabem na tela
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicamentoAppBar(onSearch: _filterMedicamentos),
      body: Container(
        color: const Color.fromARGB(223, 33, 59, 105),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _medicamentos.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _medicamentos.length) {
              return const LoadingIndicator();
            }

            final medicamento = _medicamentos[index];
            return MedicamentoTile(
              medicamento: medicamento,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}



/* import 'package:flutter/material.dart';
import 'package:medicamentapp/core/widgets/medicamento_app_bar.dart';
import 'package:medicamentapp/core/widgets/medicamento_tile.dart';
import 'package:medicamentapp/shared/widgets/loading_indicator.dart';
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
  int _page = 1;
  final int _limit = 15;
  bool _isLoading = false;
  bool _hasMoreItems = true;
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();
  final double _tileHeight = 40.0;

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
      print('Total de medicamentos recebidos: ${_medicamentos.length}');
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
    final offsetParaChamadaApi = _tileHeight * 5;

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - offsetParaChamadaApi &&
        !_isLoading &&
        _hasMoreItems) {
      _fetchMedicamentos();
    }
  }

  void _filterMedicamentos(String query) {
    if (query.isEmpty || query.length >= 3) {
      setState(() {
        _searchQuery = query;
        _medicamentos.clear(); // Limpa a lista para exibir novos resultados
        _page = 1; // Reinicia a paginação
        _hasMoreItems = true; // Permite carregar mais itens
      });
      _fetchMedicamentos(); // Realiza nova busca, com ou sem filtro
    }

    /*   if (query.length >= 3 || query.isEmpty) {
      setState(() {
        _searchQuery = query;
        _medicamentos.clear();
        _page = 1;
        _hasMoreItems = true;
      });
      _fetchMedicamentos();
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicamentoAppBar(onSearch: _filterMedicamentos),
      body: Container(
        color: const Color.fromARGB(223, 33, 59, 105),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _medicamentos.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _medicamentos.length) {
              return const LoadingIndicator();
            }

            final medicamento = _medicamentos[index];
            return MedicamentoTile(
              medicamento: medicamento,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
 */