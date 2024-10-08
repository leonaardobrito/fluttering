import 'package:flutter/material.dart';
import '../widgets/mensagens_lista.dart';
import '../widgets/app_bar.dart';
import '../widgets/tab_button.dart';

class MensagensAvisosScreen extends StatefulWidget {
  const MensagensAvisosScreen({super.key});

  @override
  _MensagensAvisosScreenState createState() => _MensagensAvisosScreenState();
}

class _MensagensAvisosScreenState extends State<MensagensAvisosScreen> {
  int _selectedTabIndex = 0;
  final List<Map<String, dynamic>> todasMensagens = [
    {
      'title': 'Aviso de Agendamento',
      'pacient': 'Emília A.',
      'time': 'há 2 horas',
      'isNew': true,
      'icon': Icons.calendar_today
    },
    {
      'title': 'Renovação de Receita',
      'pacient': 'José Valdo A.',
      'time': 'há 8 horas',
      'isNew': true,
      'icon': Icons.receipt_long
    },
    {
      'title': 'Aviso de Vacina',
      'pacient': 'José A.',
      'time': 'há 3 horas',
      'isNew': false,
      'icon': Icons.vaccines
    },
    {
      'title': 'Aviso de Agendamento',
      'pacient': 'José A.',
      'time': 'Ontem',
      'isNew': false,
      'icon': Icons.calendar_today
    },
    {
      'title': 'Transferência de Agenda',
      'pacient': 'Emília A.',
      'time': 'há 2 dias',
      'isNew': false,
      'icon': Icons.swap_horiz
    },
    {
      'title': 'Aviso de Automonitoramento',
      'pacient': 'José Valdo A.',
      'time': 'há 5 dias',
      'isNew': false,
      'icon': Icons.monitor_heart
    },
    {
      'title': 'Aviso de Agendamento',
      'pacient': 'Herculano A.',
      'time': '01/08/2024',
      'isNew': false,
      'icon': Icons.calendar_today
    },
  ];
  // TODO: chamar a api

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'MENSAGENS E AVISOS'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabButton(
                    title: 'Todas',
                    isSelected: _selectedTabIndex == 0,
                    onTap: () => _onTabSelected(0)),
                TabButton(
                    title: 'Não Lidas',
                    isSelected: _selectedTabIndex == 1,
                    onTap: () => _onTabSelected(1)),
                TabButton(
                    title: 'Lidas',
                    isSelected: _selectedTabIndex == 2,
                    onTap: () => _onTabSelected(2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tipo: "),
                DropdownButton<String>(
                  value: 'Todos',
                  onChanged: (String? newValue) {},
                  items: <String>[
                    'Todos',
                    'Agendamentos',
                    'Receitas',
                    'Vacinas'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const Text("Pessoas: "),
                DropdownButton<String>(
                  value: 'Todos',
                  onChanged: (String? newValue) {},
                  items: <String>[
                    'Todos',
                    'Emília A.',
                    'José A.',
                    'José Valdo A.'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: MessageList(
                selectedTabIndex: _selectedTabIndex,
                todasMensagens: todasMensagens,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }
}

/* import 'package:flutter/material.dart';
import 'agendamento.dart';
import 'package:medicamentapp/features/medicamentos/widgets/app_bar.dart';

class MensagensAvisosScreen extends StatefulWidget {
  const MensagensAvisosScreen({super.key});

  @override
  _MensagensAvisosScreenState createState() => _MensagensAvisosScreenState();
}

class _MensagensAvisosScreenState extends State<MensagensAvisosScreen> {
  int _selectedTabIndex = 0;
  final List<Map<String, dynamic>> todasMensagens = [
    {
      'title': 'Aviso de Agendamento',
      'pacient': 'Emília A.',
      'time': 'há 2 horas',
      'isNew': true,
      'icon': Icons.calendar_today
    },
    {
      'title': 'Renovação de Receita',
      'pacient': 'José Valdo A.',
      'time': 'há 8 horas',
      'isNew': true,
      'icon': Icons.receipt_long
    },
    {
      'title': 'Aviso de Vacina',
      'pacient': 'José A.',
      'time': 'há 3 horas',
      'isNew': false,
      'icon': Icons.vaccines
    },
    {
      'title': 'Aviso de Agendamento',
      'pacient': 'José A.',
      'time': 'Ontem',
      'isNew': false,
      'icon': Icons.calendar_today
    },
    {
      'title': 'Transferência de Agenda',
      'pacient': 'Emília A.',
      'time': 'há 2 dias',
      'isNew': false,
      'icon': Icons.swap_horiz
    },
    {
      'title': 'Aviso de Automonitoramento',
      'pacient': 'José Valdo A.',
      'time': 'há 5 dias',
      'isNew': false,
      'icon': Icons.monitor_heart
    },
    {
      'title': 'Aviso de Agendamento',
      'pacient': 'Herculano A.',
      'time': '01/08/2024',
      'isNew': false,
      'icon': Icons.calendar_today
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'MENSAGENS E AVISOS'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabButton(
                    title: 'Todas',
                    isSelected: _selectedTabIndex == 0,
                    onTap: () => _onTabSelected(0)),
                TabButton(
                    title: 'Não Lidas',
                    isSelected: _selectedTabIndex == 1,
                    onTap: () => _onTabSelected(1)),
                TabButton(
                    title: 'Lidas',
                    isSelected: _selectedTabIndex == 2,
                    onTap: () => _onTabSelected(2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tipo: "),
                DropdownButton<String>(
                  value: 'Todos',
                  onChanged: (String? newValue) {},
                  items: <String>[
                    'Todos',
                    'Agendamentos',
                    'Receitas',
                    'Vacinas'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const Text("Pessoas: "),
                DropdownButton<String>(
                  value: 'Todos',
                  onChanged: (String? newValue) {},
                  items: <String>[
                    'Todos',
                    'Emília A.',
                    'José A.',
                    'José Valdo A.'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: _buildMessageList(),
            ),
          ],
        ),
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _buildMessageList() {
    List<Map<String, dynamic>> nonReadMessages =
        todasMensagens.where((message) => message['isNew'] == true).toList();
    List<Map<String, dynamic>> readMessages =
        todasMensagens.where((message) => message['isNew'] == false).toList();

    if (_selectedTabIndex == 0) {
      return ListView(
        children: [
          const SectionTitle(title: 'Não Lidas'),
          ...nonReadMessages.map((message) => NotificationTile(
                icon: message['icon'],
                title: message['title'],
                pacient: message['pacient'],
                time: message['time'],
                isNew: message['isNew'],
                onTap: () {
                  if (message['title'] == 'Aviso de Agendamento') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgendamentoScreen()),
                    );
                  }
                },
              )),
          const Divider(),
          const SectionTitle(title: 'Lidas'),
          ...readMessages.map((message) => NotificationTile(
                icon: message['icon'],
                title: message['title'],
                pacient: message['pacient'],
                time: message['time'],
                isNew: message['isNew'],
                onTap: () {
                  // TODO: lidas
                },
              )),
        ],
      );
    } else if (_selectedTabIndex == 1) {
      return ListView.builder(
        itemCount: nonReadMessages.length,
        itemBuilder: (context, index) {
          final message = nonReadMessages[index];
          return NotificationTile(
            icon: message['icon'],
            title: message['title'],
            pacient: message['pacient'],
            time: message['time'],
            isNew: message['isNew'],
            onTap: () {
              if (message['title'] == 'Aviso de Agendamento') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AgendamentoScreen()),
                );
              }
            },
          );
        },
      );
    } else {
      return ListView.builder(
        itemCount: readMessages.length,
        itemBuilder: (context, index) {
          final message = readMessages[index];
          return NotificationTile(
            icon: message['icon'],
            title: message['title'],
            pacient: message['pacient'],
            time: message['time'],
            isNew: message['isNew'],
            onTap: () {
              // TODO: açao pra clicar em mensagens lidas
            },
          );
        },
      );
    }
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 40,
              color: Colors.blue,
            )
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String pacient;
  final String time;
  final bool isNew;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.pacient,
    required this.time,
    required this.isNew,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(
                    icon,
                    size: 24,
                    color: Colors.blue.shade900,
                  ),
                ),
                if (isNew)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    pacient,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
 */
