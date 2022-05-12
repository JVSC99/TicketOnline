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
        return Carteira(
          id: carteira[0]['id'],
          alunoId: carteira[0]['alunoId'],
          saldo: carteira[0]['saldo']
        );
      }

      return null;
  }

  findByAlunoId (int id) async {
      db = await DB.instance.database;

      List carteira = await db.query('carteira', where: 'id = $id');
       
      if(carteira.isNotEmpty){
        return Carteira(
          id: carteira[0]['id'],
          alunoId: carteira[0]['alunoId'],
          saldo: carteira[0]['saldo']
        );
      }

      return null;
  }
}
