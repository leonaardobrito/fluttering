import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final double fontSize;

  const GreetingWidget({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Olá, ',
            style: TextStyle(
              fontSize: fontSize + 4,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Emília!',
                style: TextStyle(
                  fontSize: fontSize + 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const Text(
          'O que você precisa hoje?',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
