import 'package:flutter/material.dart';
import 'package:medicamentapp/core/utils/string_extension.dart';
import '../models/medicamento.dart';

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
            Text('Uso: ${medicamento.uso}'),
            const SizedBox(height: 8),
            Text('Apresentação: ${medicamento.apresentacao ?? ''}'),
            const SizedBox(height: 8),
            Text('Unidade de Medida: ${medicamento.apresentacaoUnimed}'),
            const SizedBox(height: 8),
            Text('Situação: ${medicamento.situacao}'),
          ],
        ),
      ),
    );
  }
}
