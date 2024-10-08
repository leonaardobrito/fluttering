import '../models/menu_item_model.dart'; // Certifique-se de que o caminho esteja correto

List<MenuItem> menuItems = [
  MenuItem(
    title: 'Notificações',
    subtitle: 'Mensagens e Avisos',
    svgPath: 'lib/app/resources/icons/Notificação.svg',
  ),
  MenuItem(
    title: 'Minhas Agendas',
    subtitle: 'Atendimentos, Solicitações,...',
    svgPath: 'lib/app/resources/icons/Agendamento.svg',
  ),
  MenuItem(
    title: 'Minha Saúde',
    subtitle: 'Automonitoramento',
    svgPath: 'lib/app/resources/icons/Automonitoramento.svg',
  ),
  MenuItem(
    title: 'Meu Perfil',
    subtitle: 'Dados pessoais, Pessoas vinculadas',
    svgPath: 'lib/app/resources/icons/Paciente.svg',
  ),
  MenuItem(
    title: 'Outros Serviços',
    subtitle: 'Consultar lista de espera, atendimentos,...',
    svgPath: 'lib/app/resources/icons/Outros.svg',
  ),
];
