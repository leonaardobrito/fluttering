import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

class MedicamentoAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearch;

  const MedicamentoAppBar({super.key, required this.onSearch});

  @override
  MedicamentoAppBarState createState() => MedicamentoAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(138.0);
}

class MedicamentoAppBarState extends State<MedicamentoAppBar> {
  late Debouncer _debouncer;
  static const int debouncePeriod = 500;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer();
  }

  @override
  void dispose() {
    _debouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90.0,
      backgroundColor: const Color.fromARGB(223, 11, 24, 49),
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'e-CIDADÃO SAÚDE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          Text(
            'JARAGUÁ DO SUL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              letterSpacing: 1.2,
              color: Color.fromARGB(255, 5, 185, 240),
            ),
          ),
          Text(
            'MEDICAMENTOS',
            style: TextStyle(
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
              const Icon(
                Icons.search,
                color: Colors.white,
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
                    const duration = Duration(milliseconds: debouncePeriod);
                    _debouncer.debounce(
                      duration: duration,
                      onDebounce: () => widget.onSearch(query),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/* import 'package:flutter/material.dart';

class MedicamentoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearch;

  const MedicamentoAppBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90.0,
      backgroundColor: const Color.fromARGB(223, 11, 24, 49),
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'e-CIDADÃO SAÚDE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          Text(
            'JARAGUÁ DO SUL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              letterSpacing: 1.2,
              color: Color.fromARGB(255, 5, 185, 240),
            ),
          ),
          Text(
            'MEDICAMENTOS',
            style: TextStyle(
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
                  onChanged: onSearch,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(138.0);
}
 */