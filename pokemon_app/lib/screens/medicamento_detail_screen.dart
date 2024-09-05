import 'package:flutter/material.dart';
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
