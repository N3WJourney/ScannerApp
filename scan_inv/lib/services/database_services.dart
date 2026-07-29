import 'package:path/path.dart';
import 'package:scan_inv/services/inventory_services.dart';
import 'package:scan_inv/services/model/inventory_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  //DatabaseServices._init();
  //static final DatabaseServices instance = DatabaseServices._init();

  static Database? _database;
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
    final tableHeadings = InventoryModel().getTableDesign();
    await _database!.execute('''
      CREATE TABLE inventory (
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
    for (var item in items) {
      await _database!.insert('inventory', item.toMap());
    }
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
