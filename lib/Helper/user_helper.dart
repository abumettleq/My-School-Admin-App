import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_school_admin_app/Model/user_model.dart';

class UserHelper{
  UserHelper._();
  static UserHelper userHelper = UserHelper._();

  // create userCollection to identify users firebase collection
  CollectionReference<Map<String,dynamic>> userCollection = FirebaseFirestore.instance.collection('users');

  // create function that get user data from firebase according to a user id
  String? userID;

  Future<UserModel> login(String id, String password) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await userCollection.doc(id).get();
    Map<String, dynamic>? dataMap = documentSnapshot.data();

    if (dataMap == null) {
      
      return UserModel.fromMap({}); // Return a default UserModel object in case of failure
    }

    if (dataMap['password'] != password) {
      
      return UserModel.fromMap({}); // Return a default UserModel object in case of failure
    }

    userID = id;

    return UserModel.fromMap(dataMap);
  }


  // Future<UserProfileModel> getUserProfile()async{
  //   CollectionReference<Map<String,dynamic>> mainCollection = FirebaseFirestore.instance.collection('users');
  //   DocumentReference mainDoc = mainCollection.doc(userID);
  //   CollectionReference<Map<String,dynamic>> subCollection = mainDoc.collection('itemMenu');
  //   DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await subCollection.doc('profile').get();
  //   Map<String, dynamic>? dataMap = documentSnapshot.data();
  //   print(dataMap);
  //   return UserProfileModel.fromMap(dataMap!);
  // }
}