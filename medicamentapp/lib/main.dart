import 'package:flutter/material.dart';
import 'features/medicamentos/screens/medicamento_list_screen.dart';

void main() {
  runApp(const MedicamentApp());
}

class MedicamentApp extends StatelessWidget {
  const MedicamentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Medicamentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MedicamentoListScreen(),
    );
  }
}
