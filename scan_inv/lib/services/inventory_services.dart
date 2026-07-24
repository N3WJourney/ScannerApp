import 'package:sqflite/sqflite.dart';

class InventoryServices {
  String columnID = 'id';
  String columnName = 'name';
  String? column1;
  String? column2;
  String? column3;
  String? column4;
  Database db;

  Future openDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'inventory.db');
    db = await openDatabase(
      'inventory.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE inventory (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            quantity INTEGER
          )
        ''');
      },
    );
  } // open Database

  //set and get Columns

  //insert to database

  //get from database

  //update database

  //delete from database

  // Add your inventory service methods here
}
