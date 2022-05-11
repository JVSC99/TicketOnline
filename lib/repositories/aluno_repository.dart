import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_online/database/db.dart';
import 'package:ticket_online/model/aluno.dart';
import 'package:ticket_online/model/carteira.dart';
import 'package:ticket_online/model/historico.dart';
import 'package:ticket_online/repositories/historico_repository.dart';
import 'package:ticket_online/repositories/carteira_repository.dart';

class AlunoRepository extends ChangeNotifier {

  late Database db;

  Aluno? aluno;

  HistoricoRepository historicoRepository = HistoricoRepository();

  CarteiraRepository carteiraRepository = CarteiraRepository();

  findById (int id) async {
      db = await DB.instance.database;
      List alunos = await db.query('aluno', where: 'id = $id');

      return null;
  }

  findByRA (String ra) async {
      db = await DB.instance.database;
      List aluno = await db.query('aluno', where: 'ra = $ra');
      return aluno.first;
  }

  get () async {
      db = await DB.instance.database;
      List alunos = await db.query('aluno');
      return alunos;
  }

  static List<Aluno> lista = [
    Aluno(
        id: 1,
        nome: 'João Victor',
        ra: '123',
        senha: '1234',
        carteira: Carteira(id: 1, saldo: 1),
        historico: [
          Historico(id: 1, data: '9/03/2022', refeicao: 'Jantar'),
          Historico(id: 2, data: '9/03/2022', refeicao: 'Almoço'),
          Historico(id: 3, data: '10/03/2022', refeicao: 'Jantar'),
          Historico(id: 4, data: '10/03/2022', refeicao: 'Almoço'),
          Historico(id: 5, data: '11/03/2022', refeicao: 'Jantar'),
          Historico(id: 6, data: '11/03/2022', refeicao: 'Almoço'),
          Historico(id: 7, data: '12/03/2022', refeicao: 'Jantar'),
          Historico(id: 8, data: '12/03/2022', refeicao: 'Almoço'),
        ],
        imagePath:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
    Aluno(
        id: 1,
        nome: 'Alysson Victor',
        ra: '234567',
        senha: '1234',
        carteira: Carteira(id:1, saldo: 100),
        historico: [
          Historico(id: 9, data: '12/03/2022', refeicao: 'Jantar'),
          Historico(id: 10, data: '12/03/2022', refeicao: 'Almoço'),
          Historico(id: 11, data: '11/03/2022', refeicao: 'Jantar'),
          Historico(id: 12, data: '11/03/2022', refeicao: 'Almoço'),
          Historico(id: 13, data: '10/03/2022', refeicao: 'Jantar'),
          Historico(id: 14, data: '10/03/2022', refeicao: 'Almoço'),
          Historico(id: 15, data: '09/03/2022', refeicao: 'Jantar'),
          Historico(id: 16, data: '09/03/2022', refeicao: 'Almoço'),
        ],
        imagePath:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
  ];
}
