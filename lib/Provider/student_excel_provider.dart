

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_school_admin_app/Helper/student_excel_helper.dart';
import 'package:my_school_admin_app/Model/student_excel_model.dart';
import 'package:excel/excel.dart';
import 'package:my_school_admin_app/Router/app_router.dart';

class StudentExcelProvider with ChangeNotifier
{
  FilePickerResult? result;
  PlatformFile? excelFile;
  Map<String,dynamic> currentExcelMap = {};
  StudentExcelFile? studentExcelFile;
  StudentExcelHelper studentExcelHelperHere = StudentExcelHelper.studentExcelHelper;

  void selectExcelFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      allowMultiple: false,
    );

    if (result != null) {
      final selectedFile = result!.files.single;
      final fileBytes = selectedFile.bytes;

      if (fileBytes != null) {
        // Check the file type based on its content
        final fileExtension = getFileExtensionFromBytes(fileBytes);
        if (fileExtension == 'xlsx' || fileExtension == 'xls') {
          // The selected file is an Excel file
          excelFile = selectedFile;
          result = null;
          AppRouter.showSnackBar("Success", "Excel Sheet File was picked!");
          notifyListeners();
          readExcelFile();
        } else {
          AppRouter.showErrorSnackBar("Failed", "Please select an Excel file.");
        }
      } else {
        AppRouter.showErrorSnackBar("Failed", "Failed to read the selected file.");
      }
    } else {
      AppRouter.showErrorSnackBar("Failed", "Excel Sheet File was not picked!");
    }
    notifyListeners();
  }

  String getFileExtensionFromBytes(Uint8List fileBytes) {
    // Check the first few bytes to determine the file type
    if (fileBytes.length >= 2) {
      if (fileBytes[0] == 0x50 && fileBytes[1] == 0x4B) {
        return 'xlsx'; // This indicates it's a ZIP archive, which XLSX files are
      } else if (fileBytes[0] == 0xD0 && fileBytes[1] == 0xCF) {
        return 'xls'; // This indicates it's an XLS file
      }
    }
    return ''; // Unknown or unsupported file type
  }

  readExcelFile() async
  {
    try{
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

          studentExcelFile = StudentExcelFile.fromMap(currentExcelMap);
          studentExcelHelperHere.createNewUser(studentExcelFile!);
        }
      }

      excelFile = null;
      studentExcelFile = null;
      currentExcelMap = {};
      notifyListeners();
    }catch (error) {
      AppRouter.showErrorSnackBar("Failed", "Failed to read the selected file.");
      log(error.toString());
    }

  }
}