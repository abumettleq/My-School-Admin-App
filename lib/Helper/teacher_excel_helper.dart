import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_school_admin_app/Model/teacher_excel_model.dart';

class TeacherExcelHelper {
  TeacherExcelHelper._();
  static TeacherExcelHelper teacherExcelHelper = TeacherExcelHelper._();

  DocumentReference<Map<String, dynamic>>? docReference;

  Future<void> createNewUser(List<TeacherExcelModel?> teachers) async {
    for (var teacherExcelFile in teachers) {
      docReference = FirebaseFirestore.instance
          .collection('users')
          .doc(teacherExcelFile!.teacherID)
          .collection("itemMenu")
          .doc("profile");

      await docReference!.set(teacherExcelFile.toMap());

      docReference = FirebaseFirestore.instance
          .collection('users')
          .doc(teacherExcelFile.teacherID);

      await docReference!
          .update({'password': 'A${teacherExcelFile.teacherID}a', 'type': '1'});
    }
  }
}
