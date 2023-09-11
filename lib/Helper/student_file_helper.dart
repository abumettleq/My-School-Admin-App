import 'package:cloud_firestore/cloud_firestore.dart';

class StudentExcelHelper
{
  StudentExcelHelper._();
  static StudentExcelHelper studentExcelHelper = StudentExcelHelper._();

  CollectionReference<Map<String,dynamic>> collectionReference = FirebaseFirestore.instance.collection('users');

}