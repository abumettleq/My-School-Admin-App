class TeacherExcelFile
{
  String? teacherID,
          nID,
          fullName,
          gender,
          birthdate,
          phoneNumber,
          email,
          dateOfHire,
          employmentStatus,
          jobTitle,
          degreeHeld,
          salary;

  TeacherExcelFile({
    required this.birthdate,
    required this.dateOfHire,
    required this.degreeHeld,
    required this.email,
    required this.employmentStatus,
    required this.fullName,
    required this.gender,
    required this.jobTitle,
    required this.nID,
    required this.phoneNumber,
    required this.salary,
    required this.teacherID
  });

  factory TeacherExcelFile.fromMap(Map<String,dynamic> map){
    return TeacherExcelFile(
        teacherID: map['teacherID'],
        nID: map['nID'],
        fullName: map['full_name'],
        gender: map['gender'],
        birthdate: map['birthdate'],
        phoneNumber: map['phone_number'],
        email: map['email'],
        dateOfHire: map['date_of_hire'],
        employmentStatus: map['employment_status'],
        jobTitle: map['job_title'],
        degreeHeld: map['degree_held'],
        salary: map['salary']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'teacherID': teacherID,
      'nId': nID,
      'full_name': fullName,
      'gender': gender,
      'birthdate': birthdate,
      'phone_number': phoneNumber,
      'email': email,
      'date_of_hire': dateOfHire,
      'employment_status': employmentStatus,
      'job_title': jobTitle,
      'degree_held': degreeHeld,
      'salary': salary
    };
  }
}