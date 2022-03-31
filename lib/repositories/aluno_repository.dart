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
          Historico(data: '12/03/2022', refeicao: 'janta'),
        ])
  ];
}
