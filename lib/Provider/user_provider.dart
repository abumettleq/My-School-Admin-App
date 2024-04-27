import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:my_school_admin_app/Helper/user_helper.dart';
import 'package:my_school_admin_app/Model/admin_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:my_school_admin_app/Model/teacher_model.dart';
import 'package:my_school_admin_app/Model/user_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:my_school_admin_app/screens/mainview.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class UserProvider with ChangeNotifier {
  UserProvider(){
    categorizeDocuments();
    notifyListeners();
  }

  GlobalKey<FormState> loginKey = GlobalKey();
  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  bool canShowContainer = false;

  toggleContainer()
  {
    canShowContainer =! canShowContainer;
    notifyListeners();
  }

  nullValidation (String? v){
    if(v == null || v.isEmpty){
      return 'Required *';
    }
  }

  String? userIDValidator(String? value){
    if(value!.isEmpty){
      return 'Required *';
    }else if(value.length<9){
      return 'Your ID Must be 9 digits';
    }
    return null;
  }
  String? passwordValidator(String? value){
    if(value!.isEmpty){
      return 'Required *';
    }
    else if(value.length<8){
      return 'Your Password less than 8';
    }
    return null;
  }

  UserModel? userModel;

  login()async{
    bool result = await InternetConnection().hasInternetAccess;
    if(result){

      if(loginKey.currentState!.validate()){
        userModel = await UserHelper.userHelper.login(userIDController.text,passwordController.text);
        if(userModel == null){
          btnController.reset();
          AppRouter.showErrorSnackBar("Login failed", "Wrong Username or Password");

        }else{
          btnController.success();
          Future.delayed(const Duration(milliseconds: 600), () async {
            AppRouter.pushWithReplacementToWidget(const MainView());
          });
          userIDController.clear();
          passwordController.clear();
        }

      }else {
        btnController.reset();
        AppRouter.showErrorSnackBar("Login failed", "Please try again later");
      }
    }else{
      btnController.reset();
      AppRouter.showErrorSnackBar(
          "No Internet", "Failed to connect to the server");
      }
    }

    int teachersNumber = 0;
    int studentsNumber = 0;
    int totalUsers = 0;
  categorizeDocuments()async{
    await UserHelper.userHelper.categorizeDocuments();
    studentsNumber = UserHelper.userHelper.studentDocuments.length;
    teachersNumber = UserHelper.userHelper.teacherDocuments.length;
    totalUsers = studentsNumber + teachersNumber;
    notifyListeners();
  }

  List<AdminModel> adminDetails = [];

  getAdminProfile()async{
    adminDetails = await UserHelper.userHelper.getAdminProfile(userIDController.text);
    log(adminDetails.toString());
    notifyListeners();
  }

  List<StudentModel> studentsData = [];
  List<TeacherModel> teacherData = [];

  getStudentData()async{
    await UserHelper.userHelper.getUsersData();
    studentsData = UserHelper.userHelper.studentsData;
    log(studentsData.length.toString());
    notifyListeners();
  }

  getTeacherData()async{
    await UserHelper.userHelper.getUsersData();
    teacherData = UserHelper.userHelper.teacherData;
    log(teacherData.length.toString());
    notifyListeners();
  }

  clearStudentData(){
    studentsData.clear();
    notifyListeners();
  }

  clearTeacherData(){
    teacherData.clear();
    notifyListeners();
  }

  }
