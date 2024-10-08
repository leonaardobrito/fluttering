/* import 'package:flutter/material.dart';

class MensagensScreen extends StatefulWidget {
  const MensagensScreen({super.key});

  @override
  _MensagensScreenState createState() => _MensagensScreenState();
}

class _MensagensScreenState extends State<MensagensScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 11, 24, 49),
        title: const Text(
          'MENSAGENS E AVISOS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // TODO: Implementar ação de voltar
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150', // TODO: Substituir pela URL da imagem do perfil
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TabBarMenu(
            selectedIndex: _selectedIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: _selectedIndex == 0
                ? const MensagemList(naoLidas: true)
                : const MensagemList(naoLidas: false),
          ),
        ],
      ),
    );
  }
}

class TabBarMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const TabBarMenu({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Aba "Todas"
          GestureDetector(
            onTap: () => onTabSelected(0),
            child: Text(
              'Não Lidas',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                color: selectedIndex == 0 ? Colors.blue : Colors.black,
              ),
            ),
          ),
          // Aba "Lidas"
          GestureDetector(
            onTap: () => onTabSelected(1),
            child: Text(
              'Lidas',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                color: selectedIndex == 1 ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MensagemList extends StatelessWidget {
  final bool naoLidas;

  const MensagemList({required this.naoLidas});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        // Exibe a lista de mensagens conforme a aba selecionada (lidas ou não lidas)
        naoLidas
            ? NotificationTile(
                title: 'Aviso de Agendamento',
                subtitle: 'Emilia A.',
                trailingText: 'há 2 horas',
                iconData: Icons.calendar_today,
                iconColor: Colors.lightBlue,
                onTap: () {
                  // Navega para a tela de detalhes do aviso de agendamento
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompromissoAgendadoScreen()),
                  );
                },
              )
            : Column(
                children: [
                  NotificationTile(
                    title: 'Aviso de Vacina',
                    subtitle: 'José A.',
                    trailingText: 'há 3 horas',
                    iconData: Icons.medical_services,
                    iconColor: Colors.blueAccent,
                    onTap: () {
                      // Ação ao clicar no item
                    },
                  ),
                  NotificationTile(
                    title: 'Aviso de Agendamento',
                    subtitle: 'José A.',
                    trailingText: 'Ontem',
                    iconData: Icons.calendar_today,
                    iconColor: Colors.blueAccent,
                    onTap: () {
                      // Navega para a tela de detalhes do aviso de agendamento
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompromissoAgendadoScreen()),
                      );
                    },
                  ),
                ],
              ),
      ],
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailingText;
  final IconData iconData;
  final Color iconColor;
  final VoidCallback onTap;

  const NotificationTile({
    required this.title,
    required this.subtitle,
    required this.trailingText,
    required this.iconData,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          iconData,
          color: iconColor,
          size: 40,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(trailingText),
        onTap: onTap,
      ),
    );
  }
}

// Tela do compromisso agendado, semelhante ao código anterior
class CompromissoAgendadoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(223, 11, 24, 49),
        title: const Text('COMPROMISSO AGENDADO'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Consulta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Paciente: Emilia A.'),
                    Text('Data: 05/11/2024 (terça-feira)'),
                    Text('Hora: 16h30'),
                    Text('Local: ESF Bairro Moinhos'),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Ok, tudo certo!'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */