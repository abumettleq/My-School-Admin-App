import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_school_admin_app/Helper/teacher_excel_helper.dart';
import 'package:my_school_admin_app/Model/teacher_excel_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:excel/excel.dart';


class TeacherExcelProvider with ChangeNotifier
{
  FilePickerResult? result;
  PlatformFile? excelFile;
  Map<String,dynamic> currentExcelMap = {};
  TeacherExcelFile? teacherExcelFile;
  TeacherExcelHelper teacherExcelHelperHere = TeacherExcelHelper.teacherExcelHelper;

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

        int maxRows = decodedExcel.tables[table]!.maxRows;
        if(maxRows <= 0)
        {
          AppRouter.showErrorSnackBar("Info", "The excel file was empty.");
          break;
        }

        for(int i = 0; i < maxRows; i++)
        {
          var row = decodedExcel.tables[table]!.rows[i];

          // is the file following the pattern required?
          if(i == 0 && row[0]!.value.toString() != 'teacherID') // No? then terminate reading process.
          {
            AppRouter.showErrorSnackBar("Error", "The Excel file had an invalid pattern.");
            break;
          }
          else if(i == 0) { // Yes? then skip to next row.
            continue;
          }

          currentExcelMap['teacherID'] = row[0]!.value.toString();
          currentExcelMap['nID'] = row[1]!.value.toString();
          currentExcelMap['full_name'] = row[2]!.value.toString();
          currentExcelMap['gender'] = row[3]!.value.toString();
          currentExcelMap['birthdate'] = row[4]!.value.toString();
          currentExcelMap['phone_number'] = row[5]!.value.toString();
          currentExcelMap['email'] = row[6]!.value.toString();
          currentExcelMap['date_of_hire'] = row[7]!.value.toString();
          currentExcelMap['employment_status'] = row[8]!.value.toString();
          currentExcelMap['job_title'] = row[9]!.value.toString();
          currentExcelMap['degree_held'] = row[10]!.value.toString();
          currentExcelMap['salary'] = row[11]!.value.toString();

          teacherExcelFile = TeacherExcelFile.fromMap(currentExcelMap);
          teacherExcelHelperHere.createNewUser(teacherExcelFile!);
        }
      }

      excelFile = null;
      teacherExcelFile = null;
      currentExcelMap = {};
      notifyListeners();
    }catch (error) {
      AppRouter.showErrorSnackBar("Failed", "Failed to read the selected file.");
    }
  }
}