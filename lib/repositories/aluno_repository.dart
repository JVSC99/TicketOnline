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

  Future<Aluno> findById (int id) async {

      db = await DB.instance.database;

      List alunos = await db.query('aluno', where: 'id = $id');
      
      Carteira carteira = await carteiraRepository.findByAlunoId(id);

      List<Historico> historico = await historicoRepository.getByAlunoId(id);

      if(alunos.isNotEmpty){
        return createAluno(alunos, carteira, historico);
      }

      throw("Não existe aluno com o ID informado");
  }

  Future<Aluno> findByRA (String ra) async {
      db = await DB.instance.database;

      List alunos = await db.query('aluno', where: 'ra = ${ra}');
      
      Carteira carteira = await carteiraRepository.findByAlunoId(alunos.first["id"]);

      List<Historico> historico = await historicoRepository.getByAlunoId(alunos.first["id"]);

      if(alunos.isNotEmpty){
        return createAluno(alunos, carteira, historico);
      }

      throw("Não existe aluno com o RA informado");
  }
  
  Future<void> save(Aluno aluno) async{
    db = await DB.instance.database;      

    try{
        if(aluno.id != 0){

          Aluno alunoExistente = await findById(aluno.id);

          db.update(
            'aluno', 
            {
              'nome': alunoExistente.nome,
              'ra': alunoExistente.ra,
              'senha': alunoExistente.senha
            },
            where: 'id = ?',
            whereArgs: [alunoExistente.id]
          );

          carteiraRepository.save(aluno.carteira, aluno.id);

          if(aluno.historico.isNotEmpty){
            for(int i = 0; i < aluno.historico.length; i++){
              historicoRepository.save(aluno.historico[i], aluno.id);
            }
          }
      }else{
        int alunoId = await db.insert(
          'aluno', {
          'nome': aluno.nome,
          'ra': aluno.ra,
          'senha': aluno.senha
        });
      }
    }catch(error){
        throw(error.toString());  
    }
  }

  createAluno(alunos, carteira, historico) {
        return Aluno(
          id: alunos.first['id'],
          nome: alunos.first['nome'],
          ra: alunos.first['ra'],
          senha: alunos.first['senha'],
          carteira: carteira,
          historico: historico,
          imagePath: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
        );
  }

  static List<Aluno> lista = [
    Aluno(
        id: 1,
        nome: 'João Victor',
        ra: '123',
        senha: '1234',
        carteira: Carteira(alunoId: 1, id: 1, saldo: 1),
        historico: [
          Historico(alunoId: 1, id: 1, data: '9/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 1, id: 2, data: '9/03/2022', refeicao: 'Almoço'),
          Historico(alunoId: 1, id: 3, data: '10/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 1, id: 4, data: '10/03/2022', refeicao: 'Almoço'),
          Historico(alunoId: 1, id: 5, data: '11/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 1, id: 6, data: '11/03/2022', refeicao: 'Almoço'),
          Historico(alunoId: 1, id: 7, data: '12/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 1, id: 8, data: '12/03/2022', refeicao: 'Almoço'),
        ],
        imagePath:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
    Aluno(
        id: 1,
        nome: 'Alysson Victor',
        ra: '234567',
        senha: '1234',
        carteira: Carteira(alunoId: 2, id:1, saldo: 100),
        historico: [
          Historico(alunoId: 2, id: 9, data: '12/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 2, id: 10, data: '12/03/2022', refeicao: 'Almoço'),
          Historico(alunoId: 2, id: 11, data: '11/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 2, id: 12, data: '11/03/2022', refeicao: 'Almoço'),
          Historico(alunoId: 2, id: 13, data: '10/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 2, id: 14, data: '10/03/2022', refeicao: 'Almoço'),
          Historico(alunoId: 2, id: 15, data: '09/03/2022', refeicao: 'Jantar'),
          Historico(alunoId: 2, id: 16, data: '09/03/2022', refeicao: 'Almoço'),
        ],
        imagePath:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
  ];
}
