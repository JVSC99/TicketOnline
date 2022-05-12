import 'package:flutter/cupertino.dart';
import 'package:ticket_online/model/historico.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_online/database/db.dart';

class HistoricoRepository extends ChangeNotifier {

  late Database db;

  List<Historico> historicos = [];

  findById (int id) async {

      db = await DB.instance.database;

      List historico = await db.query('historico', where: 'id = $id');
       
      if(historico.isNotEmpty){
        return Historico(
          id: historico.first['id'],
          alunoId: historico.first['alunoId'],
          data: historico.first['data'],
          refeicao: historico.first['refeicao']
        );
      }

      throw("Não existe carteira com o ID informado");
  }

  getByAlunoId (int id) async {

      db = await DB.instance.database;

      List historico = await db.query('historico', where: 'alunoId = $id');

      if(historico.isNotEmpty){
        
        for(int i = 0; i < historico.length; i++){
          historicos.add(
              Historico(
                id: historico[i]['id'],
                alunoId: historico[i]['alunoId'],
                data: historico[i]['data'],
                refeicao: historico[i]['refeicao']
            )
          );
        }

      }
      
      return historicos;
  }

  createHistorico(historico){
    return Historico(
        id: historico.first['id'],
        alunoId: historico.first['alunoId'],
        data: historico.first['data'],
        refeicao: historico.first['refeicao']
    );
  }
}
