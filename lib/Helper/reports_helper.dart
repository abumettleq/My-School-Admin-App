import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/reports_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';

class ReportsHelper {
  ReportsHelper._();
  static ReportsHelper reportsHelper = ReportsHelper._();

  CollectionReference<Map<String, dynamic>>? colReference =
      FirebaseFirestore.instance.collection('reports');

  Future<List<ReportsModel>> getAllReports() async {
    try {
      QuerySnapshot querySnapshot = await colReference!.get();
      List<ReportsModel> reports = [];

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        ReportsModel report = ReportsModel.fromMap(data, document.id);
        reports.add(report);
      }
      return reports;

    } catch (e) {
      debugPrint('Error getting reports: $e');
      rethrow;
    }
  }

  Future<void> deleteItem(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection('reports').doc(documentId).delete();
      AppRouter.showSnackBar("Deleted", "report deleted successfully.");
    } catch (e) {
      AppRouter.showErrorSnackBar("Failed", "Error deleting item, try again!");

    }
  }
}
