class AdminModel {

  String? name;
  String? imageUrl;

  AdminModel({
   this.name,
   this.imageUrl,
  });

  AdminModel.fromMap(Map<String,dynamic> map){
    name = map['name'];
    imageUrl = map['picture'];
  }

}