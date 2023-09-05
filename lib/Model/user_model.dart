class UserModel{
  String? password;

  UserModel({
    required this.password
  });
  Map<String,dynamic> toMap(){
    return {
      'password': password
    };
  }

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
      password: map['password'],
    );
  }



}