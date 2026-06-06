import 'dart:async';
import 'dart:convert';
//import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';

Future<PlatformFile?> pickFileImport() async {
  try {
    FilePickerResult? result = await FilePicker.pickFiles(
        //type: FileType.custom,
        //allowedExtensions: ['csv', 'xlsx'],
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

void openCSV(PlatformFile file) {
  final csvString = utf8.decode(file.bytes!);
  final fields = csv.decode(csvString);
  //final fields = const Csv().convert(inputList);
  for (var row in fields) {
    //print(row);
  }
}

void openExcel(PlatformFile file) {
  final input = file.bytes;
  var excel = Excel.decodeBytes(input!);
  //var headings = List<Data>;
  for (var table in excel.tables.keys) {
    //print(table); //sheet Name
    //print(excel.tables[table]!.maxColumns);
    //print(excel.tables[table]!.maxRows);
    var rows = excel.tables[table]!.rows;
    //headings.add(rows.first);
    for (var row in rows) {
      //print("$row");
    }
  }
  // Process the Excel data as needed
}
