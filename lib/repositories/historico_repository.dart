import 'package:flutter/cupertino.dart';
import 'package:ticket_online/model/historico.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_online/database/db.dart';

class HistoricoRepository extends ChangeNotifier {

  late Database db;

  List<Historico> historicos = [];

  Future<Historico> findById (int id) async {

      db = await DB.instance.database;

      List historico = await db.query('historico', where: 'id = $id');
       
      if(historico.isNotEmpty){
        return _createHistorico(historico);
      }

      throw("Não existe carteira com o ID informado");
  }

  Future<List<Historico>> getByAlunoId (int id) async {

      db = await DB.instance.database;

      List historico = await db.query('historico', where: 'alunoId = $id');

      if(historico.isNotEmpty){
        
        for(int i = 0; i < historico.length; i++){
          historicos.add(
            _createHistorico(historico[i])
          );
        }

      }
      
      return historicos;
  }

  Future<void> save(Historico historico, int alunoId) async {

    db = await DB.instance.database;      

    if(historico.id != 0){

      try{
        Historico historicoExistente = await findById(historico.id);

        db.update(
          'historico', 
          {
            'refeicao': historicoExistente.refeicao,
            'data': historicoExistente.data
          },
          where: 'id = ?',
          whereArgs: [historico.id]
        );

      }catch(error){
        throw("Não é possível atualizar o historico, ID não registrado");  
      }
    
    }else{
      db.insert(
        'historico', {
        'alunoId': alunoId,
        'refeicao': historico.refeicao,
        'data': historico.data
      });
    }

  }

  _createHistorico(historico){
    return Historico(
        id: historico.first['id'],
        alunoId: historico.first['alunoId'],
        data: historico.first['data'],
        refeicao: historico.first['refeicao']
    );
  }
}
