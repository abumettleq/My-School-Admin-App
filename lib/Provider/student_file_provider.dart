import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'dart:io';


class StudentExcelProvider with ChangeNotifier
{
  FilePickerResult? result;
  File? excelFile;

  selectExcelFile() async
  {
    result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['xlsx'], allowMultiple: false,);
    if(result != null)
    {
      excelFile = result as File?;
      result = null;
      notifyListeners();
      log("File was picked!");
    }
    else
    {
      log("File was not picked!");
      notifyListeners();
    }
  }

  readExcelFile() async 
  {
    var bytes = excelFile!.readAsBytesSync();
    var decodedExcel = Excel.decodeBytes(bytes);

    for (var table in decodedExcel.tables.keys) {
      log(table); //sheet Name
      log(decodedExcel.tables[table]!.maxCols.toString());
      log(decodedExcel.tables[table]!.maxRows.toString());
      for (var row in decodedExcel.tables[table]!.rows) {
        log('$row');
      }
    }
  }



}