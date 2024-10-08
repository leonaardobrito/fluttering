import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearchChanged;

  const SearchBar({required this.onSearchChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Transform(
            transform: Matrix4.rotationY(3.14),
            alignment: Alignment.center,
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              autofocus: false,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Buscar pelo nome',
                hintStyle: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.w300
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              onChanged: onSearchChanged,
            ),
          ),
        ],
      ),
    );
  }
}
