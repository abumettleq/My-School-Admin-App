class StudentExcelModel
{
  String studentID;
  String studentName;
  String fatherName;
  String motherName;
  String gender;
  String birthday;
  String bloodGroup;
  String address;
  String phoneNumber;
  String email;
  String academicYear;
  String currentClass;
  String image;

  StudentExcelModel({
    this.address = '',
    this.image = '',
    this.studentName = '',
    this.birthday = '',
    this.bloodGroup = '',
    this.academicYear = '',
    this.currentClass = '',
    this.fatherName = '',
    this.gender = '',
    this.motherName = '',
    this.phoneNumber = '',
    this.email = '',
    this.studentID = ''
  });

  factory StudentExcelModel.fromMap(Map<String,dynamic> map){
    return StudentExcelModel(
        studentID: map['studentID'] ?? " ",
        email: map['email'] ?? " ",
        address: map['address'] ?? " ",
        image: map['image'] ?? " ",
        studentName: map['name'] ?? " ",
        birthday: map['birthday'] ?? " ",
        bloodGroup: map['blood_group'] ?? " ",
        academicYear: map['academic_year'] ?? " ",
        currentClass: map['current_class'] ?? " ",
        fatherName: map['father_name'] ?? " ",
        gender: map['gender'] ?? " ",
        motherName: map['mother_name'] ?? " ",
        phoneNumber: map['phone_number'] ?? " "
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name': studentName,
      'address': address,
      'image': image,
      'birthday': birthday,
      'blood_group': bloodGroup,
      'academic_year': academicYear,
      'current_class': currentClass,
      'father_name': fatherName,
      'gender': gender,
      'mother_name': motherName,
      'phone_number': phoneNumber,
      'email': email,
      'studentID': studentID
    };
  }
}