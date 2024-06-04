import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_school_admin_app/Helper/md5_helper.dart';
import 'package:my_school_admin_app/Model/student_excel_model.dart';

class StudentExcelHelper {
  StudentExcelHelper._();
  static StudentExcelHelper studentExcelHelper = StudentExcelHelper._();

  Future<void> createNewUser(List<StudentExcelModel> students) async {
    for (var studentExcelFile in students) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(studentExcelFile.studentID)
          .set({'password': Md5Hepler.md5Helper.generateMd5('A${studentExcelFile.studentID}a'), 'type': '2', 'currentClass':studentExcelFile.currentClass});

      await FirebaseFirestore.instance
          .collection('users')
          .doc(studentExcelFile.studentID)
          .collection("itemMenu")
          .doc("profile")
          .set(studentExcelFile.toMap());
    }
  }
}
