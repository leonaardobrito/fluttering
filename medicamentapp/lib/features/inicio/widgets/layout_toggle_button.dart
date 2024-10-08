import 'package:flutter/material.dart';

class LayoutToggleButton extends StatelessWidget {
  final bool isGrid;
  final VoidCallback toggleLayout;

  const LayoutToggleButton({
    Key? key,
    required this.isGrid,
    required this.toggleLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Cor de fundo padrão
        borderRadius: BorderRadius.circular(30), // Cantos arredondados
        border: Border.all(color: Colors.blueAccent, width: 1.5), // Borda azul
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (isGrid) toggleLayout(); // Alterna para grid
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isGrid
                    ? Colors.blue
                    : Colors.transparent, // Fundo azul quando grid está ativo
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Icon(
                Icons.grid_view,
                color: isGrid
                    ? Colors.white
                    : Colors.blueAccent, // Ícone branco quando grid ativo
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isGrid) toggleLayout(); // Alterna para lista
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: !isGrid
                    ? Colors.blue
                    : Colors.transparent, // Fundo azul quando lista está ativa
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Icon(
                Icons.view_list,
                color: !isGrid
                    ? Colors.white
                    : Colors.blueAccent, // Ícone branco quando lista ativa
              ),
            ),
          ),
        ],
      ),
    );
  }
}
