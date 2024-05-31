
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:my_school_admin_app/Helper/classes_helper.dart';
import 'package:my_school_admin_app/Model/class_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';

class ClassesExcelProvider with ChangeNotifier
{
  PlatformFile? excelFile;

  void selectExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      allowMultiple: false,
    );

    if (result != null) {
      final selectedFile = result.files.single;
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
      AppRouter.showErrorSnackBar("Info", "Excel Sheet File was not picked!");
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

  readExcelFile()
  {
    try{
      var bytes = excelFile!.bytes;
      var decodedExcel = Excel.decodeBytes(bytes!);
      List<ClassModel> classes = [];

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

          // is the first row following the pattern required?
          if(i == 0) 
          {
            if(row[0]!.value.toString() != 'id') // No? then terminate reading process.
            {
              AppRouter.showErrorSnackBar("Error", "The Excel file had an invalid pattern.");
              break;
            }
            else // Yes? then skip to next row. (first row is always skipped)
            {
            continue;
            }
          }
          ClassModel nClass = ClassModel();
          nClass.id = row[0]!.value.toString();
          nClass.name = row[1]!.value.toString();
          nClass.section = row[2]!.value.toString();
          classes.add(nClass);
        }
      }

      if(classes.isNotEmpty)
      {
        ClassesHelper.classesHelper.addClasses(classes);
        AppRouter.showSnackBar("Success", "Classes were uploaded successfully.");
      }

      excelFile = null;
      notifyListeners();
    }catch (error) {
      AppRouter.showErrorSnackBar("Failed", "Failed to read the selected file.");
    }
  }
}