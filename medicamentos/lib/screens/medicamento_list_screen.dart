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
  final int _limit = 15;
  bool _isLoading = false;
  bool _hasMoreItems = true;
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();
  // conferir definição no novo design - Figma
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
    final offsetParaChamadaApi = _tileHeight * 3;

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
      appBar: AppBar(
        toolbarHeight: 90.0,
        backgroundColor: const Color.fromARGB(223, 11, 24, 49),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'e-CIDADÃO SAÚDE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
            Text(
              'JARAGUÁ DO SUL',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                letterSpacing: 1.2,
                color: Color.fromARGB(255, 5, 185, 240),
              ),
            ),
            Text(
              'MEDICAMENTOS',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Transform(
                  transform: Matrix4.rotationY(3.14),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Buscar pelo nome',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      filled: false,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    onChanged: _filterMedicamentos,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
          return const Center(child: CircularProgressIndicator());
        }

        final medicamento = _medicamentos[index];
        return ListTile(
          title: Text(
            medicamento.descricao.capitalize(),
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Text(
            medicamento.uso,
            style: const TextStyle(color: Colors.white),
          ),
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
