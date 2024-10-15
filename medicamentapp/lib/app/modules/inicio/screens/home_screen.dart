import 'package:flutter/material.dart';
import '../../medicamentos/screens/medicamento_list_screen.dart';
import '../../notificacoes/screens/avisos.dart';
import '../widgets/app_bar.dart';
import '../widgets/fontSize_tunning_button.dart';
import '../widgets/greetings.dart';
import '../widgets/grid_tile_widget.dart';
import '../widgets/layout_toggle_button.dart';
import '../widgets/list_tile_widget.dart';
import '../models/menu_items.dart';
import '../../../shared/utils/olos_colors.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MedicamentoListScreen()),
        );
        break;
      case 2:
        // TODO: Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaSaudeScreen()));
        break;
      case 3:
        // TODO: Navigator.push(context, MaterialPageRoute(builder: (context) => MeuPerfilScreen()));
        break;
      case 4:
        // TODO: Navigator.push(context, MaterialPageRoute(builder: (context) => OutrosServicosScreen()));
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
    if (fontSize <= 19) {
      setState(() {
        fontSize += 1.0;
      });
    }
  }

  void decreaseFontSize() {
    if (fontSize >= 16) {
      setState(() {
        fontSize -= 1.0;
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
      backgroundColor: OlosColors.olos50,
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
                          onTap: () => navigateToScreen(index),
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
                          onTap: () => navigateToScreen(index),
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
