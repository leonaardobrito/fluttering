import 'package:flutter/material.dart';
import '../models/medicamento.dart';
import '../services/medicamento_api_service.dart';
import 'medicamento_detail_screen.dart';

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
  final int _limit = 10;
  bool _isLoading = false;
  bool _hasMoreItems = true;
  String _searchQuery = 'di'; // Busca inicial padrão
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

  void _filterMedicamentos(String query) {
    if (query.length >= 2) {
      setState(() {
        _searchQuery = query;
        _medicamentos.clear();
        _page = 1;
        _hasMoreItems = true;
      });
      _fetchMedicamentos();
    } else {
      // Se a busca for menor que 2 caracteres, usa esse "coringa" PROVISORIO
      setState(() {
        _searchQuery = 'di';
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
      appBar: AppBar(
        title: const Text('Lista de medicamentos'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              autofocus: false,
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
          title: Text(medicamento.descricao.capitalize()),
          trailing: Text(medicamento.uso),
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
}


/* import 'package:flutter/material.dart';
import '../models/medicamento.dart';
import '../services/medicamento_api_service.dart';
import 'medicamento_detail_screen.dart';

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
  final int _limit = 10;
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

  void _filterMedicamentos(String query) {
    setState(() {
      _searchQuery = query;
      _medicamentos.clear();
      _page = 1;
      _hasMoreItems = true;
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
          // leading: Text(*),
          title: Text(medicamento.descricao.capitalize()),
          trailing: Text(medicamento.uso),
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
}



/* import 'package:flutter/material.dart';
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
 */ */