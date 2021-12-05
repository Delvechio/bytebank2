import 'package:bytebank2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao{

  static const String tablesql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARYKEY, '
      '$_name TEXT,'
      '$_accountNumber INTERGER';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async{
    final Database db = await getDatabase();
    return _toMap(contact, db);
    // return getDatabase().then((db) {
    //   final Map<String, dynamic> contactMap = Map();
    //   contactMap['name'] = contact.name;
    //   contactMap['account_number'] = contact.accountNumber;
    //   return db.insert('contacts', contactMap);
    // });
  }

  Future<int> _toMap(Contact contact, Database db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async{

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;

    // return getDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contact> contacts = [];
    //     for (Map<String, dynamic> map in maps) {
    //       final Contact contact = Contact(
    //         map['id'],
    //         map['name'],
    //         map['account_number'],
    //       );
    //       contacts.add(contact);
    //     }
    //     return contacts;
    //   });
    // });
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}