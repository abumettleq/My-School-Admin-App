import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Helper/classes_helper.dart';
import 'package:my_school_admin_app/Model/class_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ClassesProvider with ChangeNotifier
{
  bool isClassesDataLoading = true;
  List<ClassModel> classesData = [];
  getClassesData() async
  {
    isClassesDataLoading = true;
    classesData = await ClassesHelper.classesHelper.getAllClasses();
    isClassesDataLoading = false;
    notifyListeners();
  }

  List<StudentModel> studentsData = [];
  bool isStudentDataLoading = true;
  getStudentData(String classId) async {
    isStudentDataLoading = true;
    studentsData = await ClassesHelper.classesHelper.getStudentsByClassId(classId);
    isStudentDataLoading = false;
    notifyListeners();
  }

  clearClassesData() {
    classesData.clear();
    notifyListeners();
  }

  clearStudentsData() {
    studentsData.clear();
    notifyListeners();
  }

  TextEditingController searchClassesController = TextEditingController();
  List<ClassModel> searchClasses(String str) {
    if(str.isEmpty)
    {
      notifyListeners();
      return [];
    }

    List<ClassModel> searchedClasses = [];

    for(var gClass in classesData)
    {
      if(gClass.toSearchable().toLowerCase().contains(str.toLowerCase()))
      {
        searchedClasses.add(gClass);
      }
    }

    debugPrint("number of classes found: ${searchedClasses.length}");

    notifyListeners();
    return searchedClasses;
  }

  TextEditingController searchStudentsController = TextEditingController();
  List<StudentModel> searchStudentsInClass(String str) {
    if(str.isEmpty)
    {
      notifyListeners();
      return [];
    }

    List<StudentModel> searchedStudents = [];

    for(var student in studentsData)
    {
      if(student.toSearchable().toLowerCase().contains(str.toLowerCase()))
      {
        searchedStudents.add(student);
      }
    }

    notifyListeners();
    return searchedStudents;
  }

  RoundedLoadingButtonController clrBtnCntrl = RoundedLoadingButtonController();
  Future<void> clearStudentsFromClass(String classId) async
  {
    await ClassesHelper.classesHelper.clearStudentsFromClass(classId);
    clrBtnCntrl.reset();
    AppRouter.pop();
    AppRouter.showSnackBar(
          "Success", "Students in class '$classId' were cleared successfully.");
    notifyListeners();
  }

  Future<void> notifyStudentsByClass(String classId, String text) async
  {
    await ClassesHelper.classesHelper.notifyStudentsByClass(classId, text);
    AppRouter.showSnackBar(
          "Success", "Students in class '$classId' were notified successfully.");
    notifyListeners();
  }
}