import 'package:flutter/material.dart';
/* import 'package:flutter_svg/flutter_svg.dart';
import '../../medicamentos/screens/mensagens.dart';
import '../models/menu_item_model.dart'; */
import '../../notificacoes/screens/mensagens_avisos.dart';
//import '../../medicamentos/screens/mensagens_avisos.dart';

import '../widgets/app_bar.dart';
import '../widgets/fontSize_tunning_button.dart';
import '../widgets/greetings.dart';
import '../widgets/grid_tile_widget.dart';
import '../widgets/layout_toggle_button.dart';
import '../widgets/list_tile_widget.dart';
import '../models/menu_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  double fontSize = 16.0;

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MensagensAvisosScreen()),
        );
        break;
      case 1:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MinhasAgendasScreen()));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MensagensAvisosScreen()), // Alterar para sua tela
        );
        break;
      case 2:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaSaudeScreen()));
        break;
      case 3:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MeuPerfilScreen()));
        break;
      case 4:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => OutrosServicosScreen()));
        break;
    }
  }

  // TODO: Verificar máximos e minimos.
  void toggleLayout(bool isGridLayout) {
    setState(() {
      isGrid = isGridLayout;
    });
  }

  void increaseFontSize() {
    if (fontSize <= 20) {
      setState(() {
        fontSize += 2.0;
      });
    }
  }

  void decreaseFontSize() {
    if (fontSize >= 14) {
      setState(() {
        fontSize -= 2.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      // olos/50
      backgroundColor: const Color.fromARGB(255, 232, 235, 238),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GreetingWidget(
              fontSize: fontSize,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FontSizeTuningButton(
                  onDecrease: decreaseFontSize,
                  onIncrease: increaseFontSize,
                ),
                LayoutToggleButton(
                  isGrid: isGrid,
                  onLayoutChange: toggleLayout,
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
                        return GestureDetector(
                          onTap: () => navigateToScreen(
                              index), // Adicionando a navegação
                          child: GridTileWidget(
                            menuItem: menuItems[index],
                            fontSize: fontSize,
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => navigateToScreen(
                              index), // Adicionando a navegação
                          child: ListTileWidget(
                            menuItem: menuItems[index],
                            fontSize: fontSize,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
