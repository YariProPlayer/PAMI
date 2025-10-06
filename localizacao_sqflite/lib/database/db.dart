import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static Future<Database> initDB() async{
    final path = await getDatabasesPath();

    return openDatabase(
      join(path, 'localizacao.db'),
      onCreate: (db, version) async{
        await db.execute(
          '''
          CREATE TABLE localizacoes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          latitude REAL,
          longitude REAL,
          carimboData TEXT
          )
          '''
        );
      }
    );
  }
  //METODO PARA EXECUTA A QUERY
  static Future<List<Map<String, dynamic>>> getLocalizacao() async{
    final db = await initDB();
    return await db.query('localizacoes');
  }
}