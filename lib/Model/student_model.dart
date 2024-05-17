class StudentModel{
  String studentID = '';
  String studentName = '';
  String fatherName = '';
  String motherName = '';
  String gender = '';
  String birthday = '';
  String bloodGroup = '';
  String address = '';
  String phoneNumber = '';
  String email = '';
  String academicYear = '';
  String currentClass = '';

  StudentModel();

  StudentModel.fromMap(Map<String,dynamic> map){
    studentID = map['studentID'] ;
    email = map['email'] ;
    address = map['address'] ;
    studentName = map['name'] ;
    birthday = map['birthday'] ;
    bloodGroup = map['blood_group'] ;
    academicYear = map['academic_year'] ;
    currentClass = map['current_class'] ;
    fatherName = map['father_name'] ;
    gender = map['gender'] ;
    motherName = map['mother_name'] ;
    phoneNumber = map['phone_number'];
  }

  String toSearchable()
  {
    return studentID +
          studentName + 
          fatherName +
          motherName +
          gender +
          birthday +
          bloodGroup +
          address +
          phoneNumber +
          email +
          academicYear +
          currentClass;
  }
}