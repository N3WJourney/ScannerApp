import 'dart:async';
import 'dart:convert';
//import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:scan_inv/services/database_services.dart';
import 'package:scan_inv/services/inventory_services.dart';
import 'dart:collection';

import 'package:scan_inv/services/model/inventory_model.dart';
import 'package:sqflite/sqflite.dart';

class FileImport {
//may require a class to encapsolate these functions
  Future<PlatformFile?> pickFileImport() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv', 'xlsx'],
      );
      if (result != null) {
        return result.files.first;
      }
    } catch (e) {
      //print('Error picking file: $e');
    }
    return null;
  }

  Future<void> readFile(PlatformFile file) async {
    if (file.extension == 'csv') {
      openCSV(file);
    } else if (file.extension == 'xlsx') {
      openExcel(file);
    }
  }

  Future<void> openCSV(PlatformFile file) async {
    final csvString = utf8.decode(file.bytes!);
    final fields = csv.decode(csvString);
    //final fields = const Csv().convert(inputList);
    var items = <InventoryServices>[];
    for (var row in fields) {
      if (fields.first == row) {
        createHeadingMap(row);
      } else {
        var item = InventoryServices();
        await item.setItem(false, row);
        items.add(item);
        if (items.length >= 500) {
          await DatabaseServices().insertItems(items);
          items.clear();
        }
      }
      await DatabaseServices().insertItems(items);
      items.clear();
    }
  }

  Future<void> openExcel(PlatformFile file) async {
    final input = file.bytes;
    var excel = Excel.decodeBytes(input!);
    var items = <InventoryServices>[];
    for (var row in excel.tables[excel.tables.keys.first]!.rows) {
      if (excel.tables[excel.tables.keys.first]!.rows.first == row) {
        createHeadingMap(row);
        continue;
      } else {
        var item = InventoryServices();
        await item.setItem(false, row);
        items.add(item);
        if (items.length >= 500) {
          await DatabaseServices().insertItems(items);
          items.clear();
        }
      }
      await DatabaseServices().insertItems(items);
      items.clear();
    }
    // Process the Excel data as needed
  }

  Future<void> createHeadingMap(List<dynamic> headings) async {
    var headingList = headings.map((h) => h.toString()).toList();
    InventoryModel().setColumnNames(headingList);
    await DatabaseServices().createTable();
  }
}
