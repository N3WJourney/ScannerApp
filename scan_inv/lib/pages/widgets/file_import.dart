import 'dart:io';
import 'dart:async';
import 'package:file_picker/file_picker.dart';

Future<File?> pickFileImport() async {
  try {
    FilePickerResult? result = await FilePicker.pickFiles();
    if (result != null) {
      // Handle the selected file
      String? filePath = result.files.single.path;
      if (filePath != null) {
        return File(filePath);
      }
    }
  } catch (e) {
    //print('Error picking file: $e');
  }
  return null;
}
