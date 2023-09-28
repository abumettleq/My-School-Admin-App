class TeacherModel{
  String? fullName;
  String? email;
  String? empStatus;
  String? contactNumber;
  String? teacherId;

  TeacherModel({
    this.fullName,
    this.email,
    this.contactNumber,
    this.empStatus,
    this.teacherId
  });

  TeacherModel.fromMap(Map<String,dynamic> map){
    fullName = map['full_name'];
    email = map['email'];
    empStatus = map['employment_status'];
    contactNumber = map['phone_number'];
    teacherId = map['teacherID'];
  }
}