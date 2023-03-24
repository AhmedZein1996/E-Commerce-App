import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> openDb() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (database, version) {
        database.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, image TEXT)');
      },
      version: 7,
    );
  }

//  static Future<void> deleteDb(String table) async {
//    final sqlDb = await DBHelper.openDb();
//    sqlDb.delete(
//      table,
//    );
//  }

  static Future<void> updateDb(String table, Map<String, dynamic> data) async {
    final sqlDb = await DBHelper.openDb();
    sqlDb.update(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertToDb(
      String table, Map<String, dynamic> data) async {
    final sqlDb = await DBHelper.openDb();
    sqlDb.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getFromDb(String table) async {
    final sqlDb = await DBHelper.openDb();
    return sqlDb.query(table);
  }
}
