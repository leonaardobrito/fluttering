// font_size_tuning_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FontSizeTuningButton extends StatelessWidget {
  final VoidCallback onDecrease; // Função para diminuir o tamanho da fonte
  final VoidCallback onIncrease; // Função para aumentar o tamanho da fonte

  const FontSizeTuningButton({
    Key? key,
    required this.onDecrease,
    required this.onIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'lib/app/resources/icons/Menos.svg',
              height: 24,
              width: 24,
              color: const Color.fromRGBO(8, 29, 49, 1),
            ),
            onPressed: onDecrease,
          ),
          SvgPicture.asset(
            'lib/app/resources/icons/TamanhoTexto.svg',
            height: 32,
            width: 32,
            color: const Color.fromRGBO(8, 29, 49, 1),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'lib/app/resources/icons/Mais.svg',
              height: 24,
              width: 24,
              color: const Color.fromRGBO(8, 29, 49, 1),
            ),
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}
