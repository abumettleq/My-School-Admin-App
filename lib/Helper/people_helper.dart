import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:my_school_admin_app/Model/teacher_model.dart';

class PeopleHelper
{
  PeopleHelper._();
  static PeopleHelper peopleHelper = PeopleHelper._();

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

  Future<void> notifyAllByType(String type, String notification) async
  {
    try
    {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users')
      .where('type', isEqualTo: type)
      .get();

      for(var doc in snapshot.docs)
      {
        await FirebaseFirestore.instance.collection('users')
        .doc(doc.id)
        .collection('itemMenu')
        .doc('profile')
        .collection('notifications')
        .add(
          {
            'text' : notification,
            'timeSent' : Timestamp.now()
          }
        );
      }
    }
    catch(e)
    {
      debugPrint("Error: $e");
    }
  }
}