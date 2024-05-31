import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Helper/classes_helper.dart';
import 'package:my_school_admin_app/Helper/people_helper.dart';
import 'package:my_school_admin_app/Model/class_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:my_school_admin_app/Model/teacher_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';

class PeopleProvider with ChangeNotifier
{
  List<StudentModel> studentsData = [];
  bool isStudentDataLoading = true;
  getStudentData() async {
    isStudentDataLoading = true;
    studentsData = await PeopleHelper.peopleHelper.getStudentsData();
    isStudentDataLoading = false;
    notifyListeners();
  }

  bool isTeachersDataLoading = true;
  List<TeacherModel> teachersData = [];
  getTeacherData() async {
    isTeachersDataLoading = true;
    teachersData = await PeopleHelper.peopleHelper.getTeachersData();
    isTeachersDataLoading = false;
    notifyListeners();
  }

  

  clearStudentsData() {
    studentsData.clear();
    notifyListeners();
  }

  clearTeachersData() {
    teachersData.clear();
    notifyListeners();
  }

  

  deleteUser(String userId) async {
    bool isDeleted = await PeopleHelper.peopleHelper.deleteUser(userId);
    if (isDeleted) {
      AppRouter.showSnackBar(
          "Success", "User record was deleted successfully.");
    } else {
      AppRouter.showErrorSnackBar(
          "Error", "Failed to delete a user record, try again later.");
    }
    AppRouter.pop();
    notifyListeners();
  }

  notifyUser(String userId, String text) async
  {
    bool isNotified = await PeopleHelper.peopleHelper.notifyUser(userId, text);
    if (isNotified) {
      AppRouter.showSnackBar(
          "Success", "User was notified successfully.");
    } else {
      AppRouter.showErrorSnackBar(
          "Error", "Failed to notify user, try again later.");
    }
    notifyListeners();
  }

  TextEditingController searchStudentsController = TextEditingController();
  List<StudentModel> searchStudents(String str) {
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

  TextEditingController searchTeachersController = TextEditingController();
  List<TeacherModel> searchTeachers(String str) {
    if(str.isEmpty)
    {
      notifyListeners();
      return [];
    }

    List<TeacherModel> searchedTeachers = [];

    for(var teacher in teachersData)
    {
      if(teacher.toSearchable().toLowerCase().contains(str.toLowerCase()))
      {
        searchedTeachers.add(teacher);
      }
    }

    notifyListeners();
    return searchedTeachers;
  }

  

  Future<void> notifyAll(String type, String notification) async
  {
    await PeopleHelper.peopleHelper.notifyAllByType(type, notification);
    if(type == "2")
    {
      AppRouter.showSnackBar("Success", "All students were notified successfully.");
    }
    else if(type == "1"){
      AppRouter.showSnackBar("Success", "All teachers were notified successfully.");
    }
    notifyListeners();
  }
}