import 'package:flutter/material.dart';
import '../widgets/tab_button.dart';
import '../../../shared/utils/olos_colors.dart';
import '../../notificacoes/widgets/app_bar.dart';

class MensagensAvisosScreen extends StatelessWidget {
  const MensagensAvisosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENSAGENS E AVISOS'),
        backgroundColor: OlosColors.olos500,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabButton(
                  title: 'Todas',
                  isSelected: true,
                  onTap: () {
                    // TODO: chamada de API
                  },
                ),
                TabButton(
                  title: 'Não Lidas',
                  isSelected: false,
                  onTap: () {
                    // TODO: chamada de API
                  },
                ),
                TabButton(
                  title: 'Lidas',
                  isSelected: false,
                  onTap: () {
                    // TODO: chamada de API
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            // Seção Não Lidas
            const SectionTitle(title: 'Não Lidas'),
            const NotificationTile(
              icon: Icons.calendar_today,
              title: 'Aviso de Agendamento',
              sender: 'Emília A.',
              time: 'há 2 horas',
              isNew: true,
            ),
            const NotificationTile(
              icon: Icons.receipt_long,
              title: 'Renovação de Receita',
              sender: 'José Valdo A.',
              time: 'há 8 horas',
              isNew: true,
            ),
            const Divider(),
            // Seção Lidas
            const SectionTitle(title: 'Lidas'),
            const NotificationTile(
              icon: Icons.vaccines,
              title: 'Aviso de Vacina',
              sender: 'José A.',
              time: 'há 3 horas',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.calendar_today,
              title: 'Aviso de Agendamento',
              sender: 'José A.',
              time: 'Ontem',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.swap_horiz,
              title: 'Transferência de Agenda',
              sender: 'Emília A.',
              time: 'há 2 dias',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.monitor_heart,
              title: 'Aviso de Automonitoramento',
              sender: 'José Valdo A.',
              time: 'há 5 dias',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.calendar_today,
              title: 'Aviso de Agendamento',
              sender: 'Herculano A.',
              time: '01/08/2024',
              isNew: false,
            ),
          ],
        ),
      ),
    );
  }
}

/* 
class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final double width;

  const TabButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
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
} */

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
  final String sender;
  final String time;
  final bool isNew;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.sender,
    required this.time,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  sender,
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
    );
  }
}




/* import 'package:flutter/material.dart';

class MensagensAvisosScreen extends StatelessWidget {
  const MensagensAvisosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENSAGENS E AVISOS'),
        backgroundColor: const Color(0xFF0B1831),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/profile_pic.jpg'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabButton(title: 'Todas', isSelected: true),
                TabButton(title: 'Não Lidas', isSelected: false),
                TabButton(title: 'Lidas', isSelected: false),
              ],
            ),
            const SizedBox(height: 16),
            // Filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            // Seção Não Lidas
            const SectionTitle(title: 'Não Lidas'),
            const NotificationTile(
              icon: Icons.calendar_today,
              title: 'Aviso de Agendamento',
              sender: 'Emília A.',
              time: 'há 2 horas',
              isNew: true,
            ),
            const NotificationTile(
              icon: Icons.receipt_long,
              title: 'Renovação de Receita',
              sender: 'José Valdo A.',
              time: 'há 8 horas',
              isNew: true,
            ),
            const Divider(),
            // Seção Lidas
            const SectionTitle(title: 'Lidas'),
            const NotificationTile(
              icon: Icons.vaccines,
              title: 'Aviso de Vacina',
              sender: 'José A.',
              time: 'há 3 horas',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.calendar_today,
              title: 'Aviso de Agendamento',
              sender: 'José A.',
              time: 'Ontem',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.swap_horiz,
              title: 'Transferência de Agenda',
              sender: 'Emília A.',
              time: 'há 2 dias',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.monitor_heart,
              title: 'Aviso de Automonitoramento',
              sender: 'José Valdo A.',
              time: 'há 5 dias',
              isNew: false,
            ),
            const NotificationTile(
              icon: Icons.calendar_today,
              title: 'Aviso de Agendamento',
              sender: 'Herculano A.',
              time: '01/08/2024',
              isNew: false,
            ),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const TabButton({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
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
  final String sender;
  final String time;
  final bool isNew;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.sender,
    required this.time,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  sender,
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
    );
  }
}
 */