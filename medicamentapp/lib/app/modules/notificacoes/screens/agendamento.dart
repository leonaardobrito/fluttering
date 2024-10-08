import 'package:flutter/material.dart';
import 'consultas.dart';
import '../widgets/app_bar.dart';

class AgendamentoScreen extends StatelessWidget {
  const AgendamentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'MENSAGENS E AVISOS'),
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
                    const Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 30),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aviso de Agendamento',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                // TODO: passar os parametros do paciente
                                'Emília, você tem um atendimento agendado!',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(104, 119, 128, 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.person, color: Colors.black),
                              SizedBox(width: 8),
                              // TODO: passar os parametros do paciente
                              Text('Paciente: Emilia A.'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.black),
                              SizedBox(width: 8),
                              // TODO: passar os parametros do data
                              Text('Data: 05/11/2024 (terça-feira)'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.black),
                              SizedBox(width: 8),
                              // TODO: passar os parametros do horário
                              Text('Hora: 16h30'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.black),
                              SizedBox(width: 8),
                              // TODO: passar os parametros do local
                              Text('Local: ESF Bairro Moinhos'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.description, color: Colors.black),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  // TODO: passar os parametros do motivo
                                  'Motivo: Preciso fazer os meus exames de rotina',
                                  softWrap: true,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ConsultaScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(238, 119, 10, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Ver Agendamento',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Orientações gerais:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Esta mensagem é uma confirmação do agendamento descrito acima, nenhuma ação é necessária. Basta comparecer no dia e horário citados com os documentos necessários em mãos.',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Para ALTERAR ou CANCELAR o agendamento, acesse "Ver Agendamento" acima.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // TODO: implementar ação para marcar como "Não Lida"
              },
              child: const Text(
                // TODO: alterar o isNew do objeto de mensagem
                'Marcar esta mensagem como "Não Lida"',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
