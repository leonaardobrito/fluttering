import 'package:flutter/material.dart';
import '../models/medicamento.dart';

class MedicamentoDetailScreen extends StatelessWidget {
  final Medicamento medicamento;

  const MedicamentoDetailScreen({super.key, required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Medicamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Recnum', medicamento.recnum.toString()),
            _buildDetailItem('Descrição', medicamento.descricao),
            _buildDetailItem('Uso', medicamento.uso),
          ],
        ),
      ),
    );
  }

  // Função que constrói cada item da lista de detalhes
  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:pokemon_app/models/medicamento.dart';
import 'package:pokemon_app/screens/medicamento_list_screen.dart';

class MedicamentoDetailScreen extends StatelessWidget {
  final Medicamento medicamento;

  const MedicamentoDetailScreen({super.key, required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicamento.descricao.capitalize()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(medicamento.uso),
            ),
            const SizedBox(height: 16),
            Text('Descricao: ${medicamento.descricao.capitalize()}',
                style: Theme.of(context).textTheme.headlineSmall),
            Text('Uso: ${medicamento.uso}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
 */

// tela de detalhes teste
/* 
import 'package:flutter/material.dart';
import '../models/medicamento.dart';

class MedicamentoDetailScreen extends StatelessWidget {
  final Medicamento medicamento;

  const MedicamentoDetailScreen({Key? key, required this.medicamento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Medicamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Recnum', medicamento.recnum.toString()),
            _buildDetailItem('Descrição', medicamento.descricao),
            _buildDetailItem('Uso', medicamento.uso),
            _buildDetailItem('Apresentação', medicamento.apresentacao),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

 */