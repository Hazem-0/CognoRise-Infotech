import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  Database? _db;

  Future<Database?> get dB async{
    _db??=await initialDatabase();
    return _db;
  }


  initialDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'todo.dp';
    String path = join(databasePath, databaseName);

    _db = await openDatabase(path  ,onCreate: _onCreate , version: 1);
    return _db;
  }

  deleteDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'todo.dp';
    String path = join(databasePath, databaseName);

    _db = await deleteData(path);
    return _db;
  }

  _onCreate(Database? db , int version )async
  {
    await db!.execute('''
    CREATE TABLE "tasks"(
      "id"TEXT PRIMARY KEY NOT NULL  ,
      "title"TEXT NOT NULL ,
      "desciption"TEXT NOT NULL ,
      "color"TEXT NOT NULL
      )
    ''');

    

    print("on Create !!!!");


  }
  readData(String query) async{
    Database? db =await dB;
   List<Map>response =await db!.rawQuery(query);
    return response;
  }

  insertData(String query) async{
    Database? db =await dB;
    int response =await db!.rawInsert(query);
    return response;
  }

  updateData(String query) async{
    Database? db =await dB;
    int response =await db!.rawUpdate(query);
    return response;
  }
  deleteData(String query) async{
    Database? db =await dB;
    int response =await db!.rawDelete(query);
    return response;
  }


}
