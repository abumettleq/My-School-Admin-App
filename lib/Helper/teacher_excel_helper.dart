import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_school_admin_app/Model/teacher_excel_model.dart';

class TeacherExcelHelper {
  TeacherExcelHelper._();
  static TeacherExcelHelper teacherExcelHelper = TeacherExcelHelper._();

  Future<void> createNewUser(List<TeacherExcelModel> teachers) async {
    for (var teacherExcelFile in teachers) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(teacherExcelFile.teacherID)
          .set({'password': 'A${teacherExcelFile.teacherID}a', 'type': '1'});

      await FirebaseFirestore.instance
          .collection('users')
          .doc(teacherExcelFile.teacherID)
          .collection("itemMenu")
          .doc("profile")
          .set(teacherExcelFile.toMap());
    }
  }
}
