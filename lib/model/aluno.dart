import 'carteira.dart';
import 'historico.dart';

class Aluno {
  int id;
  String nome;
  String ra;
  String senha;
  Carteira carteira;
  List<Historico> historico;
  String imagePath;

  Aluno({
    required this.id,
    required this.nome,
    required this.ra,
    required this.senha,
    required this.carteira,
    required this.historico,
    required this.imagePath,
  });
}
