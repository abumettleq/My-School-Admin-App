class TeacherExcelFile
{
  String? userID;
  String? studentName;
  String? fatherName;
  String? motherName;
  String? gender;
  String? birthday;
  String? bloodGroup;
  String? address;
  String? phoneNumber;
  String? email;
  String? currentAY;
  String? currentClass;
  String? image;

  TeacherExcelFile({
    required this.address,
    required this.image,
    required this.studentName,
    required this.birthday,
    required this.bloodGroup,
    required this.currentAY,
    required this.currentClass,
    required this.fatherName,
    required this.gender,
    required this.motherName,
    required this.phoneNumber,
    required this.email,
    required this.userID
  });

  factory TeacherExcelFile.fromMap(Map<String,dynamic> map){
    return TeacherExcelFile(
        userID: map['userID'],
        email: map['email'],
        address: map['address'],
        image: map['image'],
        studentName: map['name'],
        birthday: map['birthday'],
        bloodGroup: map['blood_group'],
        currentAY: map['current_AY'],
        currentClass: map['current_class'],
        fatherName: map['father_name'],
        gender: map['gender'],
        motherName: map['mother_name'],
        phoneNumber: map['phone_number']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name': studentName,
      'address': address,
      'image': image,
      'birthday': birthday,
      'bloodGroup': bloodGroup,
      'current_AY': currentAY,
      'current_class': currentClass,
      'father_name': fatherName,
      'gender': gender,
      'mother_name': motherName,
      'phone_number': phoneNumber,
      'email': email,
      'userID': userID
    };
  }
}