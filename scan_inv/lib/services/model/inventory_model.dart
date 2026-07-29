import 'package:excel/excel.dart';
import 'package:path/path.dart';

class InventoryModel {
  static const String columnCheck = 'checked';
  static const String columnID = '_id';
  static List<String> columnNames = [];

  String getTableDesign() {
    String tableHeadings = join(columnID, ' INTEGER PRIMARY KEY AUTOINCREMENT,',
        columnCheck, ' INTEGER,');
    for (var heading in columnNames) {
      tableHeadings += ' $heading TEXT NULLABLE,';
    }
    return tableHeadings;
  }

  void setColumnNames(List<String> headings) {
    columnNames = headings;
  }
}
