import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Helper/reports_helper.dart';
import 'package:intl/intl.dart';
import 'package:my_school_admin_app/Model/reports_model.dart';

class ReportsProvider with ChangeNotifier
{
  ReportsHelper? reportsHelperHere = ReportsHelper.reportsHelper;
  List<ReportsModel>? reports;

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
}