import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if(_database != null){
      return _database;
    }

    return await _initDatabase();
  } 

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), "ticket.db"),
      version: 1,
      onCreate: _onCreate,

    );
  }

  _onCreate(db, versao) async {
    await db.execute(_aluno);
    await db.execute(_carteira);
    await db.execute(_historico);
    await db.insert(
      'aluno',
      {
        "nome": "Alysson Victor",
        "ra": "2142341",
        "senha": "Dev22@22"
      }
    );
    await db.insert(
      'carteira',
      {
        "alunoId": 1,
        "saldo": 20
      }
    );
    await db.insert(
      'historico',
      {
        "alunoId": 1,
        "data": "20220511",
        "refeicao": "almoco"
      }
    );
  }

  String get _aluno => '''
    CREATE TABLE aluno (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      ra TEXT,
      senha TEXT,
      imagePath TEXT
    );
  ''';  

  String get _carteira => '''
    CREATE TABLE carteira (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      alunoId INTEGER,
      saldo REAL
    );
  ''';  

  String get _historico => '''
    CREATE TABLE historico (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      alunoId INTEGER,
      data TEXT,
      refeicao TEXT
    );
  ''';  
}