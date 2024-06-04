import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:my_school_admin_app/Helper/classes_helper.dart';
import 'package:my_school_admin_app/Helper/md5_helper.dart';
import 'package:my_school_admin_app/Helper/people_helper.dart';
import 'package:my_school_admin_app/Helper/user_helper.dart';
import 'package:my_school_admin_app/Model/admin_model.dart';
import 'package:my_school_admin_app/Model/class_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:my_school_admin_app/Model/teacher_model.dart';
import 'package:my_school_admin_app/Model/user_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:my_school_admin_app/screens/main_view.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class UserProvider with ChangeNotifier {
  UserProvider();

  GlobalKey<FormState> loginKey = GlobalKey();
  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  bool canShowContainer = false;

  toggleContainer() {
    canShowContainer = !canShowContainer;
    notifyListeners();
  }

  nullValidation(String? v) {
    if (v == null || v.isEmpty) {
      return 'Required *';
    }
  }

  String? userIDValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required *';
    } else if (value.length < 9) {
      return 'Your ID Must be 9 digits';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required *';
    } else if (value.length < 8) {
      return 'Your Password less than 8';
    }
    return null;
  }

  UserModel? userModel;

  login() async {
    bool result = await InternetConnection().hasInternetAccess;
    if (result) {
      if (loginKey.currentState!.validate()) {
        userModel = await UserHelper.userHelper
            .login(userIDController.text, Md5Hepler.md5Helper.generateMd5(passwordController.text));
        if (userModel == null) {
          btnController.reset();
          AppRouter.showErrorSnackBar(
              "Login failed", "Wrong Username or Password");
        } else {
          btnController.success();
          categorizeDocuments();
          AppRouter.pushWithReplacementToWidget(const MainView());
          userIDController.clear();
          passwordController.clear();
        }
      } else {
        btnController.reset();
        AppRouter.showErrorSnackBar("Login failed", "Please try again later");
      }
    } else {
      btnController.reset();
      AppRouter.showErrorSnackBar(
          "No Internet", "Failed to connect to the server");
    }
  }

  int teachersNumber = 0;
  int studentsNumber = 0;
  int totalUsers = 0;
  double studentsPercentage = 0.0;
  double teachersPercentage = 0.0;
  int feedbacksNumber = 0;
  int newsNumber = 0;
  int classesNumber = 0;
  Map<String, int> libraryBooksNumber= {
    "Arabic": 0,
    "Art": 0,
    "Chemistry": 0,
    "English": 0,
    "Geography": 0,
    "History": 0,
    "Islamic": 0,
    "Math": 0,
    "Persian": 0,
    "Physics": 0,
    "Science": 0,
    "Technology": 0
  };
  bool isCategorizingDocuments = true;
  categorizeDocuments() async {
    isCategorizingDocuments = true;
    await UserHelper.userHelper.categorizeDocuments();
    studentsNumber = UserHelper.userHelper.studentDocuments;
    teachersNumber = UserHelper.userHelper.teacherDocuments;
    totalUsers = studentsNumber + teachersNumber;

    if (totalUsers > 0) {
      studentsPercentage = (studentsNumber / totalUsers) * 100;
      teachersPercentage = (teachersNumber / totalUsers) * 100;
    } else {
      studentsPercentage = 0;
      teachersPercentage = 0;
    }

    feedbacksNumber = UserHelper.userHelper.feedbackDocuments;
    newsNumber = UserHelper.userHelper.newsDocuments;
    classesNumber = UserHelper.userHelper.classesDocuments;

    libraryBooksNumber = UserHelper.userHelper.libraryDocuments;

    isCategorizingDocuments = false;
    notifyListeners();
  }

  List<AdminModel> adminDetails = [];

  getAdminProfile() async {
    adminDetails =
        await UserHelper.userHelper.getAdminProfile(userIDController.text);
    log(adminDetails.toString());
    notifyListeners();
  }

  internallyNotifyListeners()
  {
    notifyListeners();
  }
}
