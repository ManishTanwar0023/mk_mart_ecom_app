import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager extends GetxController {
  static final DatabaseManager DM = DatabaseManager.internal();

  factory DatabaseManager() => DM;



  static Database? Db;

  DatabaseManager.internal();

  Future<Database> get db async {
    if (Db != null) {
      return Db!;
    }
    Db = await initDb();
    return Db!;
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'user_details.db');
    return await openDatabase(path, version: 1, onCreate: DatabaseCreate);
  }

  void DatabaseCreate(Database db, int newVersion) async {
    await db.execute(''
        'Create Table information('
        'Id Integer Primary Key,'
        ' Name Text,'
        ' Email Varchar,'
        ' Password Varchar,'
        ' Address Varchar,'
        ' Mobile Varchar'
        ')'
        '');
  }

  Future<List<Map<String, dynamic>>> getDataByEmail(String email) async {
    final db1 = await db ;
    return await db1.query('information', where: 'Email = ?', whereArgs: [email]);
  }


}
