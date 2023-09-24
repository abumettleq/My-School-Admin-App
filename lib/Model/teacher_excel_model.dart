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
    this.birthdate,
    this.dateOfHire,
    this.degreeHeld,
    this.email,
    this.employmentStatus,
    this.fullName,
    this.gender,
    this.jobTitle,
    this.nID,
    this.phoneNumber,
    this.salary,
    this.teacherID
  });

  factory TeacherExcelFile.fromMap(Map<String,dynamic> map){
    return TeacherExcelFile(
        teacherID: map['teacherID'] ?? " ",
        nID: map['nID'] ?? " ",
        fullName: map['full_name'] ?? " ",
        gender: map['gender'] ?? " ",
        birthdate: map['birthdate'] ?? " ",
        phoneNumber: map['phone_number'] ?? " ",
        email: map['email'] ?? " ",
        dateOfHire: map['date_of_hire'] ?? " ",
        employmentStatus: map['employment_status'] ?? " ",
        jobTitle: map['job_title'] ?? " ",
        degreeHeld: map['degree_held'] ?? " ",
        salary: map['salary'] ?? " "
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