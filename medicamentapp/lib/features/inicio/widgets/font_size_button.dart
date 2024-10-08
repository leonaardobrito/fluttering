import 'package:flutter/material.dart';

class FontSizeButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const FontSizeButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
