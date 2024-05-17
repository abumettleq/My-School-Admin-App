class TeacherModel{
  String teacherID = '',
          nID = '',
          fullName = '',
          gender = '',
          birthdate = '',
          phoneNumber = '',
          email = '',
          dateOfHire = '',
          employmentStatus = '',
          jobTitle = '',
          degreeHeld = '',
          salary = '';

  TeacherModel();

  TeacherModel.fromMap(Map<String,dynamic> map){
    teacherID = map['teacherID'];
    nID = map['nId'];
    fullName = map['full_name'];
    gender = map['gender'];
    birthdate = map['birthdate'];
    phoneNumber = map['phone_number'];
    email = map['email'];
    dateOfHire = map['date_of_hire'];
    employmentStatus = map['employment_status'];
    jobTitle = map['job_title'];
    degreeHeld = map['degree_held'];
    salary = map['salary'];
  }

  String toSearchable()
  {
    return teacherID +
          nID +
          fullName +
          gender +
          birthdate +
          phoneNumber +
          email +
          dateOfHire +
          employmentStatus +
          jobTitle +
          degreeHeld +
          salary;
  }
}