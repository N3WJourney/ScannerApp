import 'package:path/path.dart';
import 'package:scan_inv/services/inventory_services.dart';
import 'package:scan_inv/services/model/inventory_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  static final tableName = 'inventory';
  static final DatabaseServices instance = DatabaseServices._init();
  static Database? _database;
  DatabaseServices._init();

  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await _intializeDB();
    return _database!;
  } // get Database

  Future<Database> _intializeDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'inventory_database.db');
    return await openDatabase(path, version: 1);
  } // open Database

  Future<void> createTable() async {
    var db = await instance.database;
    final tableHeadings = InventoryModel().getTableDesign();
    await db!.execute('''
      CREATE TABLE $tableName (
        $tableHeadings
      )
    ''');
  } // onCreate Database

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  } // close Database

  Future<void> insertItems(List<InventoryServices> items) async {
    if (items.isEmpty) {
      return;
    }
    var db = await instance.database;
    await db!.transaction((txn) async {
      final batch = txn.batch();
      for (var item in items) {
        batch.insert(tableName, item.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit(noResult: true);
    });
  } // insert Database

  Future<InventoryServices?> getItem(int id) async {
    final List<Map<String, dynamic>> maps = await _database!.query('inventory',
        where: '$InventoryModel.columnID = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return InventoryServices.fromMap(maps.first);
    }
    return null;
  } // get specific item from Database
}
