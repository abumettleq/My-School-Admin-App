import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Helper/reports_helper.dart';
import 'package:intl/intl.dart';
import 'package:my_school_admin_app/Model/reports_model.dart';

class ReportsProvider with ChangeNotifier
{
  ReportsHelper? reportsHelperHere = ReportsHelper.reportsHelper;
  List<ReportsModel> reports = [];

  ReportsProvider()
  {
    getReportsFromHelper();
    notifyListeners();
  }

  getReportsFromHelper() async
  {
    reports = await reportsHelperHere!.getAllReports();
    notifyListeners();
  }

  String convertTimestampToString(Timestamp timestamp) {

    DateTime dateTime = timestamp.toDate();

    String formatPattern = "yyyy-MM-dd HH:mm:ss";

    DateFormat dateFormat = DateFormat(formatPattern);

    String formattedString = dateFormat.format(dateTime);

    return formattedString;
  }

  clearReports(){
    reports.clear();
    notifyListeners();
  }

  deleteReport(String id) async{
    await reportsHelperHere!.deleteItem(id);
    getReportsFromHelper();
    notifyListeners();
  }

}
