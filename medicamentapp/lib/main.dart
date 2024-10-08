import 'package:flutter/material.dart';
//import 'features/medicamentos/screens/medicamento_list_screen.dart';
//import 'features/medicamentos/screens/mensagens_inicio.dart';
//import 'features/medicamentos/screens/consultas.dart';
//import 'features/medicamentos/screens/mensagens.dart';
//import 'features/medicamentos/screens/mensagens_avisos.dart';
//import 'features/inicio/screens/home_screen.dart';
import '/app/modules/inicio/screens/home_screen.dart';

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
      //home: const MedicamentoListScreen(),
      //home: const MensagensAvisosScreen(),
      //home: CompromissoAgendadoScreen(),
      //home: MensagensScreen(),
      //home: MensagensAvisosScreen(),
      home: HomeScreen(),
    );
  }
}
