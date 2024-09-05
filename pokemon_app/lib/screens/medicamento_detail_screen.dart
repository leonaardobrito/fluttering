import 'package:flutter/material.dart';
import '../models/medicamento.dart';

class MedicamentoDetailScreen extends StatelessWidget {
  final Medicamento medicamento;

  const MedicamentoDetailScreen({super.key, required this.medicamento});

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
              'DETALHES DO MEDICAMENTO',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(223, 33, 59, 105),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(3),
                    },
                    border: TableBorder.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.0,
                    ),
                    children: [
                      _buildTableRow('Recnum', medicamento.recnum.toString()),
                      _buildTableRow('Descrição', medicamento.descricao),
                      _buildTableRow('Uso', medicamento.uso),
                      _buildTableRow('Quantidade de Apresentação',
                          medicamento.apresentacaoQtde.toString()),
                      _buildTableRow('Unidade de Apresentação',
                          medicamento.apresentacaoUnimed),
                      _buildTableRow(
                          'Situação', medicamento.situacao.toString()),
                      _buildTableRow(
                          'Apresentação', medicamento.apresentacao ?? 'N/A'),
                      _buildTableRow('Quantidade de Apresentação (Unimed)',
                          medicamento.apresentacaoUnimedQtde.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
