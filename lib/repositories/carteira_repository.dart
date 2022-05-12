import 'package:flutter/cupertino.dart';
import 'package:ticket_online/model/carteira.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_online/database/db.dart';

class CarteiraRepository extends ChangeNotifier {

  late Database db;

  List<Carteira> carteiras = [];

  findById (int id) async {

      db = await DB.instance.database;

      List carteira = await db.query('carteira', where: 'id = $id');
       
      if(carteira.isNotEmpty){
        return createCarteira(carteira);
      }

      throw("Não existe carteira com o ID informado");
  }

  findByAlunoId (int id) async {
      db = await DB.instance.database;

      List carteira = await db.query('carteira', where: 'id = $id');
       
      if(carteira.isNotEmpty){
        return createCarteira(carteira);
      }

      throw("Não existe carteira com o ID informado");
  }

  createCarteira(carteira) {
    return Carteira(
      id: carteira.first['id'],
      alunoId: carteira.first['alunoId'],
      saldo: carteira.first['saldo']
    );
  }
}
