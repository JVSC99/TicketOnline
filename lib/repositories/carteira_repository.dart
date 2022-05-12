import 'package:flutter/cupertino.dart';
import 'package:ticket_online/model/carteira.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_online/database/db.dart';
import 'package:ticket_online/model/aluno.dart';

class CarteiraRepository extends ChangeNotifier {

  late Database db;

  List<Carteira> carteiras = [];

  Future<Carteira> findById (int id) async {

      db = await DB.instance.database;

      List carteira = await db.query('carteira', where: 'id = $id');
       
      if(carteira.isNotEmpty){
        return _createCarteira(carteira);
      }

      throw("Não existe carteira com o ID informado");
  }

  Future<Carteira> findByAlunoId (int id) async {
      db = await DB.instance.database;

      List carteira = await db.query('carteira', where: 'id = $id');
       
      if(carteira.isNotEmpty){
        return _createCarteira(carteira);
      }

      throw("Não existe carteira com o ID informado");
  }

  Future<void> save(Carteira carteira, int alunoId) async {

    db = await DB.instance.database;      

    if(carteira.id != 0){

      try{
        Carteira carteiraExistente = await findById(carteira.id);

        db.update(
          'carteira', 
          {'saldo': carteiraExistente.saldo},
          where: 'id = ?',
          whereArgs: [carteiraExistente.id]
        );

      }catch(error){
        throw("Não é possível atualizar a carteira, ID não registrado");  
      }
    
    }else{
      db.insert(
        'carteira', {
        'alunoId': alunoId,
        'saldo': carteira.saldo
      });
    }

  }

  _createCarteira(carteira) {
    return Carteira(
      id: carteira.first['id'],
      alunoId: carteira.first['alunoId'],
      saldo: carteira.first['saldo']
    );
  }
}
