import 'carteira.dart';
import 'historico.dart';

class Aluno {
  String nome;
  String ra;
  String senha;
  Carteira carteira;
  List<Historico> historico;

  Aluno(
      {required this.nome,
      required this.ra,
      required this.senha,
      required this.carteira,
      required this.historico});
}
