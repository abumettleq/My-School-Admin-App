import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/admin_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:my_school_admin_app/Model/teacher_model.dart';
import 'package:my_school_admin_app/Model/user_model.dart';

class UserHelper{
  UserHelper._();
  static UserHelper userHelper = UserHelper._();

  // create userCollection to identify users firebase collection
  CollectionReference<Map<String,dynamic>> userCollection = FirebaseFirestore.instance.collection('admins');

  // create function that get user data from firebase according to a user id
  String? userID;

  Future<UserModel?> login(String id, String password) async {

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await userCollection.doc(id).get();

    Map<String, dynamic>? dataMap = documentSnapshot.data();

    if (dataMap == null || dataMap['password'] != password) {
      
      return null;
    }
    userID = id;

    return UserModel.fromMap(dataMap);
  }


  final List<DocumentSnapshot> teacherDocuments = [];
  final List<DocumentSnapshot> studentDocuments = [];

  Future<void> categorizeDocuments() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('users').get();



      for (var doc in querySnapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final String type = data['type'] ;

        if (type == '1') {
          teacherDocuments.add(doc);
        } else if (type == '2') {
          studentDocuments.add(doc);
        }
      }

      log('Type 1 documents: ${teacherDocuments.length}');
      log('Type 2 documents: ${studentDocuments.length}');
    } catch (e) {
      log('Error getting and categorizing documents: $e');
    }
  }

  Future<List<StudentModel>> getStudentsData() async
  {
    List<StudentModel> studentModels = [];
    try
    {
      QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection("users")
      .where('type', isEqualTo: "2")
      .get();

      for(var document in snapshot.docs)
      {
        StudentModel studentModel = StudentModel();

        DocumentSnapshot snapshot = await document.reference.collection('itemMenu')
        .doc('profile')
        .get();

        studentModel = StudentModel.fromMap(snapshot.data() as Map<String, dynamic>);

        studentModels.add(studentModel);
      }
    }
    catch(e)
    {
      log("Error: $e");
    }
    log('Number of students data fetched: ${studentModels.length}');
    return studentModels;
  }
  
  Future<List<TeacherModel>> getTeachersData() async
  {
    List<TeacherModel> teacherModels = [];
    try
    {
      QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection("users")
      .where('type', isEqualTo: "1")
      .get();

      for(var document in snapshot.docs)
      {
        TeacherModel teacherModel = TeacherModel();
        
        DocumentSnapshot snapshot = await document.reference.collection('itemMenu')
        .doc('profile')
        .get();

        teacherModel = TeacherModel.fromMap(snapshot.data() as Map<String, dynamic>);

        teacherModels.add(teacherModel);
      }
    }
    catch(e)
    {
      log("Error: $e");
    }
    log('Number of teachers data fetched: ${teacherModels.length}');
    return teacherModels;
  }

  Future<List<AdminModel>> getAdminProfile(String id)async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await userCollection.doc(id).collection("details").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;

    List<AdminModel> adminDetails = documents.map((e) {
      log(e.data()['name'].toString());
      AdminModel adminModel = AdminModel.fromMap(e.data());
      return adminModel;
    }).toList();

    return adminDetails;
  }

  Future<bool> deleteUser(String userId) async
  {
    try 
    {
      // Get a reference to the document
      DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(userId);

      // Delete the document
      await documentReference.delete();
      
      return true;
    } 
    catch (e) 
    {
      return false;
    }
  }

  Future<bool> notifyUser(String userId, String text) async
  {
    String collectionPath = "/users/$userId/itemMenu/profile/notifications";
    try
    {
      await FirebaseFirestore.instance.collection(collectionPath)
      .doc()
      .set(
        {
          'text': text,
          'timeSent': Timestamp.now()
        }
      );
    }
    catch(e)
    {
      debugPrint("Error: $e");
      return false;
    }
    return true;
  }
}