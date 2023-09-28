import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  final List<StudentModel> studentsData = [];
  final List<TeacherModel> teacherData = [];

  Future<void> getUsersData() async {
    studentsData.clear();
    teacherData.clear();
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();

      for (var doc in querySnapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final String type = data['type'];

        if (type == '1') {
          final QuerySnapshot userProfileSnapshot = await doc.reference.collection('itemMenu').get();

          for (var userProfileDoc in userProfileSnapshot.docs) {
            final Map<String, dynamic> userProfileData = userProfileDoc.data() as Map<String, dynamic>;

            final TeacherModel teacherModel = TeacherModel.fromMap(userProfileData);
            teacherData.add(teacherModel);
          }
        } else if (type == '2') {
          final QuerySnapshot userProfileSnapshot = await doc.reference.collection('itemMenu').get();

          for (var userProfileDoc in userProfileSnapshot.docs) {
            final Map<String, dynamic> userProfileData = userProfileDoc.data() as Map<String, dynamic>;

            final StudentModel student = StudentModel.fromMap(userProfileData);
            studentsData.add(student);
          }
        }
      }

      log('Teacher number is: ${teacherData.length}');
      log('Student number is: ${studentsData.length}');
    } catch (e) {
      log('Error getting and categorizing documents: $e');
    }
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


}