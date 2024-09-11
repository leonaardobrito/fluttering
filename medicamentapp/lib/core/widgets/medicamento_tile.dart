import 'package:flutter/material.dart';
import 'package:medicamentapp/features/medicamentos/models/medicamento.dart';

class MedicamentoTile extends StatelessWidget {
  final Medicamento medicamento;
  final VoidCallback onTap;

  const MedicamentoTile({
    super.key,
    required this.medicamento,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        medicamento.descricao,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        medicamento.uso,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: onTap,
    );
  }
}
