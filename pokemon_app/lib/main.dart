import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/medicamento_list_screen.dart';
import 'screens/pokemon_list_screen.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Medicamentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MedicamentoListScreen(),
      // home: const PokemonListScreen(),
    );
  }
}
