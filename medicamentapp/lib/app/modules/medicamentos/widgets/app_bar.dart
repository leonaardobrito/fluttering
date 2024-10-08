import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Adicionando suporte para SVG

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(8, 29, 49, 0.875), // Azul escuro
      centerTitle: true, // Centralizar título
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo à esquerda
          SvgPicture.asset(
            'lib/app/resources/Brasão.svg', // Caminho do seu arquivo SVG
            height: 32, // Altura do brasão
            color: Colors.white, // Aplicar cor branca ao logo
          ),
          const SizedBox(width: 8), // Espaçamento entre logo e título
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'e-Cidadão Saúde',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                'JARAGUÁ DO SUL/SC',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}



/* import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(8, 29, 49, 0.875),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
 */