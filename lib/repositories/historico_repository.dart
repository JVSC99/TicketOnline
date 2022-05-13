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
        notifyListeners();
        return _createHistorico(historico.first);
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
      notifyListeners();
      return historicos;
  }

  Future<void> save(Historico historico) async {

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
        'alunoId': historico.alunoId,
        'refeicao': historico.refeicao,
        'data': historico.data
      });
    }
    notifyListeners();
  }

  _createHistorico(historico){
    return Historico(
        id: historico['id'],
        alunoId: historico['alunoId'],
        data: historico['data'],
        refeicao: historico['refeicao']
    );
  }
}
