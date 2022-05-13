import 'package:ticket_online/model/historico.dart';
import 'package:ticket_online/model/aluno.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';
import 'package:ticket_online/repositories/carteira_repository.dart';
import 'package:ticket_online/repositories/historico_repository.dart';


class PagarController {

  final date = DateTime.now();
  AlunoRepository alunoRepository = AlunoRepository();
  CarteiraRepository carteiraRepository = CarteiraRepository();
  HistoricoRepository historicoRepository = HistoricoRepository();

  Future<void> pagarRefeicao(Aluno aluno) async {
     aluno.carteira.saldo -= 1;
     await historicoRepository.save(criarHistorico(aluno.id));
     await alunoRepository.save(aluno);
  }

  criarHistorico (alunoId) {
    return Historico(
        id: 0,
        alunoId: alunoId,
        data:
        '${date.day}/${date.month}/${date.year} ${date.hour - 3}:${date.minute}',
        refeicao: (date.hour - 3 < 14) ? 'Almoço ' : 'Jantar ');
  }
  
}