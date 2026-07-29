import 'package:sqflite/sqflite.dart';
import 'package:scan_inv/services/model/inventory_model.dart';

class InventoryServices {
  bool isChecked;
  int id;
  Object item;

  Future<void> setItems(bool isChecked, int id, List<String> info) async {
    this.isChecked = isChecked;
    this.id = id;
    item = await buildItem(info);
  } // set Items

  Future<Object> buildItem(List<String> info) async {
    var content = {};
    for (var i = 0; i < info.length; i++) {
      content[InventoryModel.columnNames[i]] = info[i];
    }
    return content;
  } // Map to Model

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      InventoryModel.columnID: id,
      InventoryModel.columnCheck: isChecked == false ? 0 : 1,
      ...item as Map<String, Object?>
    };
    return map;
  }

  InventoryServices.fromMap(Map<String, dynamic> map) {
    isChecked = map[InventoryModel.columnCheck] == 1;
    id = map[InventoryModel.columnID] as int;
    var content = {};
    for (var column in InventoryModel.columnNames) {
      content[column] = map[column];
    }
    item = content;
  }
  //Map invertory service to model

  //set and get Columns

  //insert to database

  //get from database

  //update database

  //delete from database

  // Add your inventory service methods here
}
