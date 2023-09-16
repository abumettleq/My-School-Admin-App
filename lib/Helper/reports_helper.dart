import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/reports_model.dart';

class ReportsHelper
{
  ReportsHelper._();
  static ReportsHelper reportsHelper = ReportsHelper._();

  CollectionReference<Map<String, dynamic>>? colReference = FirebaseFirestore.instance.collection('reports');

  Future<List<Map<String, dynamic>>> getAllReports() async {
    try {
      QuerySnapshot querySnapshot = await colReference!.get();
      List<Map<String, dynamic>> reports = [];

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        debugPrint(document.data().toString());
        reports.add({
          'id': document.id,
          'data': document.data(),
        });
      }
      return reports;
    } 
    catch (e) {
      debugPrint('Error getting reports: $e');
      rethrow;
    }
  }
}