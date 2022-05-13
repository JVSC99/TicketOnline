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
        notifyListeners();
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
        notifyListeners();
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

          carteiraRepository.save(aluno.carteira);
      }else{
        int alunoId = await db.insert(
          'aluno', {
          'nome': aluno.nome,
          'ra': aluno.ra,
          'senha': aluno.senha
        });

        carteiraRepository.save(
          Carteira(
            id: 0,
            alunoId: alunoId,
            saldo: 0
          )
        );
      }
    }catch(error){
        throw(error.toString());  
    }
    notifyListeners();
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
}
