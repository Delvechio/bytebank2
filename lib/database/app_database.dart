import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void createDatabase(){
  getDatabasesPath().then((dbPath){
    final String path = join(dbPath, 'bytebank.db');
    openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE contacts('
      'id INTEGER PRIMARYKEY, '
      'name TEXT,'
      'account_number INTERGER');
    }, version: 1);
  });
}