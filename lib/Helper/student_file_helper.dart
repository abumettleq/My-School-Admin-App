import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_school_admin_app/Model/student_file_model.dart';

class StudentExcelHelper
{
  StudentExcelHelper._();
  static StudentExcelHelper studentExcelHelper = StudentExcelHelper._();

  DocumentReference<Map<String,dynamic>>? collectionReference;

  void createNewUser(StudentExcelFile studentExcelFile)
  {
    collectionReference = FirebaseFirestore.instance.collection('users')
                                .doc(studentExcelFile.userID).collection("details")
                                .doc("profile");

    collectionReference!.set(studentExcelFile.toMap());
  }


}