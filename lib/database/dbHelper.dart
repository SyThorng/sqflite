import 'package:fb_sqlit/contant/feild.dart';
import 'package:fb_sqlit/model/u_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:developer' as dev;

class Dbhelper {
  Future<Database> initDataBase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      // .        nameDatabase
      join(path, 'Userdatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE $tblname($fuemail TEXT,$fupw TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    final db = await initDataBase();
    await db.insert(tblname!, user.toJson());
    dev.log('Insert success');
  }

  Future<List<User>> getUser() async {
    final db = await initDataBase();
    final List<Map<String, dynamic>> queryResult = await db.query(tblname!);
    return queryResult.map((e) => User.fromJson(e)).toList();
  }
}
