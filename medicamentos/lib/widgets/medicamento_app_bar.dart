import 'package:flutter/material.dart';

AppBar medicamentoAppBar({required String title}) {
  return AppBar(
    toolbarHeight: 90.0,
    backgroundColor: const Color.fromARGB(223, 11, 24, 49),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'e-CIDADÃO SAÚDE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        const Text(
          'JARAGUÁ DO SUL',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            letterSpacing: 1.2,
            color: Color.fromARGB(255, 5, 185, 240),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ],
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(48.0),
      child: Padding(
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
                      color: Colors.white, fontWeight: FontWeight.w300),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  filled: false,
                  fillColor: Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                ),
                onChanged: (query) {
                  print(query);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
