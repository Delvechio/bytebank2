import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{
  final String path = join(await getDatabasesPath(),'bytebank.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDao.tablesql);
  }, version: 1,
//      onDowngrade: onDatabaseDowngradeDelete,
  );
  /*return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');

  });

   */
}


