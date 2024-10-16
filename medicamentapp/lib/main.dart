import 'package:flutter/material.dart';
// import '/app/modules/inicio/screens/home_screen.dart';

import '/app/modules/inicio/screens/home_screen_test.dart';

void main() {
  runApp(const MedicamentApp());
}

class MedicamentApp extends StatelessWidget {
  const MedicamentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Cidadão Saúde',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
