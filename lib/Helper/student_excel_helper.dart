import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_school_admin_app/Model/student_excel_model.dart';

class StudentExcelHelper {
  StudentExcelHelper._();
  static StudentExcelHelper studentExcelHelper = StudentExcelHelper._();

  DocumentReference<Map<String, dynamic>>? docReference;

  Future<void> createNewUser(List<StudentExcelModel?> students) async {
    for (var studentExcelFile in students) {
      docReference = FirebaseFirestore.instance
          .collection('users')
          .doc(studentExcelFile!.studentID)
          .collection("itemMenu")
          .doc("profile");

      await docReference!.set(studentExcelFile.toMap());

      docReference = FirebaseFirestore.instance
          .collection('users')
          .doc(studentExcelFile.studentID);

      await docReference!
          .set({'password': 'A${studentExcelFile.studentID}a', 'type': '2'});
    }
  }
}
