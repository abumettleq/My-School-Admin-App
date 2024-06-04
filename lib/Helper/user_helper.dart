import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/admin_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:my_school_admin_app/Model/teacher_model.dart';
import 'package:my_school_admin_app/Model/user_model.dart';

class UserHelper {
  UserHelper._();
  static UserHelper userHelper = UserHelper._();

  // create userCollection to identify users firebase collection
  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection('admins');

  // create function that get user data from firebase according to a user id
  String? userID;

  Future<UserModel?> login(String id, String password) async {
    log("Pass: $password");
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userCollection.doc(id).get();

    Map<String, dynamic>? dataMap = documentSnapshot.data();

    if (dataMap == null || dataMap['password'] != password) {
      return null;
    }
    userID = id;

    return UserModel.fromMap(dataMap);
  }

  int teacherDocuments = 0;
  int studentDocuments = 0;
  int feedbackDocuments = 0;
  int newsDocuments = 0;
  int classesDocuments = 0;
  Map<String, int> libraryDocuments = {
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
  Future<void> categorizeDocuments() async {
    try {
      final QuerySnapshot pplSnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      for (var doc in pplSnapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final String type = data['type'];

        if (type == '1') {
          teacherDocuments++;
        } else if (type == '2') {
          studentDocuments++;
        }
      }

      final QuerySnapshot feedbackSnapshot =
          await FirebaseFirestore.instance.collection('feedback').get();
      feedbackDocuments = feedbackSnapshot.docs.length;

      final QuerySnapshot newsSnapshot =
          await FirebaseFirestore.instance.collection('news').get();
      newsDocuments = newsSnapshot.docs.length;

      final QuerySnapshot classesSnapshot =
          await FirebaseFirestore.instance.collection('classes').get();
      classesDocuments = classesSnapshot.docs.length;

      for (var key in libraryDocuments.keys) {
        QuerySnapshot librarySnapshot = await FirebaseFirestore.instance
            .collection('library')
            .doc('categories')
            .collection(key)
            .get();
        libraryDocuments[key] = librarySnapshot.docs.length;
        log("$key: ${librarySnapshot.docs.length}");
      }
    } catch (e) {
      log('Error getting and categorizing documents: $e');
    }
  }

  Future<List<AdminModel>> getAdminProfile(String id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await userCollection.doc(id).collection("details").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;

    List<AdminModel> adminDetails = documents.map((e) {
      log(e.data()['name'].toString());
      AdminModel adminModel = AdminModel.fromMap(e.data());
      return adminModel;
    }).toList();

    return adminDetails;
  }
}
