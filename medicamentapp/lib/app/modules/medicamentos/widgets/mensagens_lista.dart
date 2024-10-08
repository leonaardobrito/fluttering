import 'package:flutter/material.dart';
import 'package:medicamentapp/features/medicamentos/screens/agendamento.dart';

class MessageList extends StatelessWidget {
  final int selectedTabIndex;
  final List<Map<String, dynamic>> todasMensagens;

  const MessageList({
    super.key,
    required this.selectedTabIndex,
    required this.todasMensagens,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> nonReadMessages =
        todasMensagens.where((message) => message['isNew'] == true).toList();
    List<Map<String, dynamic>> readMessages =
        todasMensagens.where((message) => message['isNew'] == false).toList();

    if (selectedTabIndex == 0) {
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
                          builder: (context) => const AgendamentoScreen()),
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
                  if (message['title'] == 'Aviso de Agendamento') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // TODO: passar os parametros do agendamento
                          builder: (context) => const AgendamentoScreen()),
                    );
                  }
                },
              )),
        ],
      );
    } else if (selectedTabIndex == 1) {
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
              // TODO: Ação para mensagens lidas
            },
          );
        },
      );
    }
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
