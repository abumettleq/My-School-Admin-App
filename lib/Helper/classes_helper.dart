import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/class_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';

class ClassesHelper
{
  ClassesHelper._();
  static ClassesHelper classesHelper = ClassesHelper._();

  Future<void> addClasses(List<ClassModel> classes) async
  {
    for(var nClass in classes)
    {
      await FirebaseFirestore.instance.collection('classes').doc(nClass.id)
      .set(
        {
          'name' : nClass.name,
          'section' : nClass.section
        }
      );
    }
  }

  Future<List<ClassModel>> getAllClasses() async
  {
    List<ClassModel> classes = [];

    try
    {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('classes').get();
      for(var doc in snapshot.docs)
      {
        ClassModel gClass = ClassModel();
        gClass.id = doc.id;
        gClass.name = doc.get('name');
        gClass.section = doc.get('section');
        classes.add(gClass);
      }
    }
    catch(e)
    {
      debugPrint("Error: $e");
    }

    return classes;
  }

  Future<List<StudentModel>> getStudentsByClassId(String classId) async
  {
    List<StudentModel> studentModels = [];
    try
    {
      QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection("users")
      .where('currentClass', isEqualTo: classId)
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

  Future<void> clearStudentsFromClass(String classId) async
  {
    try
    {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users")
      .where('currentClass', isEqualTo: classId)
      .get();
      
      if(snapshot.docs.isEmpty) return;

      for(var doc in snapshot.docs)
      {
        doc.reference.set(
          {
            'currentClass' : ''
          }
        );
      }
    }
    catch(e)
    {
      debugPrint("Error: $e");
    }
  }

  Future<void> notifyStudentsByClass(String classId, String text) async
  {
    try
    {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users")
      .where('currentClass', isEqualTo: classId)
      .get();
      
      if(snapshot.docs.isEmpty) return;

      for(var doc in snapshot.docs)
      {
        doc.reference.collection('itemMenu').doc('profile').collection('notifications').add(
          {
            'text' : text,
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