import 'package:ticket_online/model/aluno.dart';
import 'package:ticket_online/model/carteira.dart';
import 'package:ticket_online/model/historico.dart';

class AlunoRepository {
  static List<Aluno> lista = [
    Aluno(
        nome: 'João Victor',
        ra: '123',
        senha: '1234',
        carteira: Carteira(id: 'João_123', saldo: 100.00),
        historico: [
          Historico(data: '12/03/2022', refeicao: 'Jantar'),
          Historico(data: '12/03/2022', refeicao: 'Almoço'),
          Historico(data: '11/03/2022', refeicao: 'Jantar'),
          Historico(data: '11/03/2022', refeicao: 'Almoço'),
          Historico(data: '10/03/2022', refeicao: 'Jantar'),
          Historico(data: '10/03/2022', refeicao: 'Almoço'),
          Historico(data: '09/03/2022', refeicao: 'Jantar'),
          Historico(data: '09/03/2022', refeicao: 'Almoço'),
        ],
        imagePath:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
  ];
}
