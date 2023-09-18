import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Helper/reports_helper.dart';
import 'package:intl/intl.dart';
import 'package:my_school_admin_app/Model/reports_model.dart';

class ReportsProvider with ChangeNotifier {
  ReportsHelper? reportsHelperHere = ReportsHelper.reportsHelper;
  List<ReportsModel>? reports;

  ReportsProvider() {
    getReportsFromHelper();
    notifyListeners();
  }

  getReportsFromHelper() async {
    reports = await reportsHelperHere!.getAllReports();
    notifyListeners();
  }

  String convertTimestampToString(Timestamp timestamp) {
    // Assuming you have a Firestore Timestamp object

    // Convert the Firestore Timestamp to a DateTime
    DateTime dateTime = timestamp.toDate();

    // Define a format pattern (e.g., "yyyy-MM-dd HH:mm:ss")
    String formatPattern = "yyyy-MM-dd HH:mm:ss";

    // Create a DateFormat object with the desired format pattern
    DateFormat dateFormat = DateFormat(formatPattern);

    // Format the DateTime as a string
    String formattedString = dateFormat.format(dateTime);

    return formattedString;
  }

  deleteReport(String id) async{
    await reportsHelperHere!.deleteItem(id);
    getReportsFromHelper();
    notifyListeners();
  }

}
