import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_school_admin_app/Helper/teacher_excel_helper.dart';
import 'package:my_school_admin_app/Model/teacher_excel_model.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'dart:io';


class TeacherExcelProvider with ChangeNotifier
{
  FilePickerResult? result;
  PlatformFile? excelFile;
  Map<String,dynamic> currentExcelMap = {};
  TeacherExcelFile? teacherExcelFile;
  TeacherExcelHelper teacherExcelHelperHere = TeacherExcelHelper.teacherExcelHelper;

  void selectExcelFile() async
  {
    result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['xlsx'], allowMultiple: false);
    if(result != null)
    {
      excelFile = result!.files.single;
      result = null;
      debugPrint('File was picked!');
      notifyListeners();
      readExcelFile();
      return;
    }

    debugPrint('File was not picked!');
    notifyListeners();
  }

  readExcelFile() async 
  {
    var bytes = excelFile!.bytes;
    var decodedExcel = Excel.decodeBytes(bytes!);

    for (var table in decodedExcel.tables.keys) {
      debugPrint(table); //sheet Name
      debugPrint(decodedExcel.tables[table]!.maxCols.toString());
      debugPrint(decodedExcel.tables[table]!.maxRows.toString());

      for(int i = 1; i < decodedExcel.tables[table]!.maxRows; i++)
      {
        var row = decodedExcel.tables[table]!.rows[i];

        currentExcelMap['userID'] = row[0]!.value.toString();
        currentExcelMap['name'] = row[1]!.value.toString();
        currentExcelMap['father_name'] = row[2]!.value.toString();
        currentExcelMap['mother_name'] = row[3]!.value.toString();
        currentExcelMap['gender'] = row[4]!.value.toString();
        currentExcelMap['birthday'] = row[5]!.value.toString();
        currentExcelMap['blood_group'] = row[6]!.value.toString();
        currentExcelMap['address'] = row[7]!.value.toString();
        currentExcelMap['phone_number'] = row[8]!.value.toString();
        currentExcelMap['current_class'] = row[9]!.value.toString();
        currentExcelMap['email'] = row[10]!.value.toString();
        currentExcelMap['current_AY'] = row[11]!.value.toString();
        currentExcelMap['image'] = row[12]!.value.toString();

        teacherExcelFile = TeacherExcelFile.fromMap(currentExcelMap);
        teacherExcelHelperHere.createNewUser(teacherExcelFile!);
      }
    }
  
    excelFile = null;
    teacherExcelFile = null;
    currentExcelMap = {};
    notifyListeners();
  }
}