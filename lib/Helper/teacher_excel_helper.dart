import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_school_admin_app/Model/teacher_excel_model.dart';

class TeacherExcelHelper
{
  TeacherExcelHelper._();
  static TeacherExcelHelper teacherExcelHelper = TeacherExcelHelper._();

  DocumentReference<Map<String,dynamic>>? docReference;

  Future<void> createNewUser(TeacherExcelFile teacherExcelFile) async {
    docReference = FirebaseFirestore.instance
        .collection('users')
        .doc(teacherExcelFile.userID)
        .collection("itemMenu")
        .doc("profile");

    await docReference!.set(teacherExcelFile.toMap());

    docReference = FirebaseFirestore.instance
        .collection('users')
        .doc(teacherExcelFile.userID);

    await docReference!.set({'password': 'A${teacherExcelFile.userID}a', 'type':'1'});
  }


}