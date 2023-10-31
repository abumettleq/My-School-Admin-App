class StudentModel{
  String? name;
  String? fatherName;
  String? address;
  String? currentClass;
  String? contactNumber;
  String? studentId;

  StudentModel({
    this.name,
    this.fatherName,
    this.address,
    this.contactNumber,
    this.currentClass,
    this.studentId
  });

  StudentModel.fromMap(Map<String,dynamic> map){
    name = map['name'];
    fatherName = map['father_name'];
    address = map['address'];
    currentClass = map['current_class'];
    contactNumber = map['phone_number'];
    studentId = map['studentID'];
  }
}