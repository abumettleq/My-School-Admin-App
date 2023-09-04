import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Helper/user_helper.dart';
import 'package:my_school_admin_app/Model/user_model.dart';

class UserProvider with ChangeNotifier {

  GlobalKey<FormState> loginKey = GlobalKey();
  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    if(loginKey.currentState!.validate()){
      userModel = await UserHelper.userHelper.login(userIDController.text,passwordController.text);
      log('The bluetooth device has been connected sukessfally.');
    }else{
      log('Wrong username or password.');
    }

  }

  // UserProfileModel? userProfileModel;

  // getUserProfile() async{
  //   userProfileModel = await UserHelper.userHelper.getUserProfile();
  //   notifyListeners();
  // }

}
