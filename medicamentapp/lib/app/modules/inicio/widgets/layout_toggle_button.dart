import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutToggleButton extends StatelessWidget {
  final bool isGrid;
  final Function(bool) onLayoutChange;

  const LayoutToggleButton({
    Key? key,
    required this.isGrid,
    required this.onLayoutChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFE5E5E5),
      ),
      child: Row(
        children: [
          // Botão de grid
          GestureDetector(
            onTap: () => onLayoutChange(true),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
                color: isGrid ? const Color(0xFF073A58) : Colors.transparent,
              ),
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'lib/app/resources/icons/VerGrade.svg',
                height: 24,
                width: 24,
                color: Colors.white,
              ),
            ),
          ),
          // Botão de lista
          GestureDetector(
            onTap: () => onLayoutChange(false),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                color: !isGrid ? const Color(0xFF073A58) : Colors.transparent,
              ),
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'lib/app/resources/icons/VerLista.svg',
                height: 24,
                width: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/* import 'package:flutter/material.dart';

class LayoutToggleButton extends StatelessWidget {
  final bool isGrid;
  final VoidCallback toggleLayout;

  const LayoutToggleButton({
    super.key,
    required this.isGrid,
    required this.toggleLayout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.blueAccent, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (isGrid) toggleLayout();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isGrid ? Colors.blue : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Icon(
                Icons.grid_view,
                color: isGrid ? Colors.white : Colors.blueAccent,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isGrid) toggleLayout();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: !isGrid ? Colors.blue : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Icon(
                Icons.view_list,
                color: !isGrid ? Colors.white : Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */