import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item_model.dart';
import '../widgets/grid_tile_widget.dart';
import '../widgets/list_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  double fontSize = 16.0;

  List<MenuItem> menuItems = [
    MenuItem(
        title: 'Notificações',
        subtitle: 'Mensagens e Avisos',
        svgPath: 'lib/app/resources/icons/Notificação.svg'),
    MenuItem(
        title: 'Minhas Agendas',
        subtitle: 'Atendimentos, Solicitações,...',
        svgPath: 'lib/app/resources/icons/Agendamento.svg'),
    MenuItem(
        title: 'Minha Saúde',
        subtitle: 'Automonitoramento',
        svgPath: 'lib/app/resources/icons/Automonitoramento.svg'),
    MenuItem(
        title: 'Meu Perfil',
        subtitle: 'Dados pessoais, Pessoas vinculadas',
        svgPath: 'lib/app/resources/icons/Paciente.svg'),
    MenuItem(
        title: 'Outros Serviços',
        subtitle: 'Consultar lista de espera, atendimentos,...',
        svgPath: 'lib/app/resources/icons/Outros.svg'),
  ];

  void toggleLayout() {
    setState(() {
      isGrid = !isGrid;
    });
  }

  void increaseFontSize() {
    setState(() {
      fontSize += 5.0;
    });
  }

  void decreaseFontSize() {
    setState(() {
      fontSize -= 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'lib/app/resources/Brasão.svg',
              height: 32,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            const Text(
              'JARAGUÁ DO SUL/SC',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 8, 29, 49),
      ),
      // olos/50
      backgroundColor: const Color.fromARGB(255, 232, 235, 238),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                        onPressed: decreaseFontSize,
                      ),
                      SvgPicture.asset(
                        'lib/app/resources/icons/TamanhoTexto.svg',
                        height: 24,
                        width: 24,
                        color: const Color.fromRGBO(8, 29, 49, 1),
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'lib/app/resources/icons/Mais.svg',
                          height: 24,
                          width: 24,
                          color: const Color.fromRGBO(8, 29, 49, 1),
                        ),
                        onPressed: increaseFontSize,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFE5E5E5),
                  ),
                  child: Row(
                    children: [
                      // Botão de grid
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGrid = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(60),
                                bottomLeft: Radius.circular(60)),
                            color: isGrid
                                ? const Color(0xFF073A58)
                                : Colors.transparent,
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
                        onTap: () {
                          setState(() {
                            isGrid = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(60),
                                bottomRight: Radius.circular(60)),
                            color: !isGrid
                                ? const Color(0xFF073A58)
                                : Colors.transparent,
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
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: isGrid
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return GridTileWidget(
                            menuItem: menuItems[index], fontSize: fontSize);
                      },
                    )
                  : ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return ListTileWidget(
                            menuItem: menuItems[index], fontSize: fontSize);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
