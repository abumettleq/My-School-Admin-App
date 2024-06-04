import 'package:my_school_admin_app/Model/attendance_model.dart';
import 'package:my_school_admin_app/Model/student_model.dart';

class StudentReportModel
{
  StudentModel student = StudentModel();
  Map<String, dynamic> results = {};
  List<AttendanceModel> attendance = [];
}