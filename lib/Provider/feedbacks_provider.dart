import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Helper/feedbacks_helper.dart';
import 'package:intl/intl.dart';
import 'package:my_school_admin_app/Model/feedbacks_model.dart';

class FeedbacksProvider with ChangeNotifier
{
  FeedbackHelper? feedbacksHelperHere = FeedbackHelper.feedbacksHelper;
  List<FeedbacksModel> feedbacks = [];

  FeedbacksProvider()
  {
    getFeedbacksFromHelper();
    notifyListeners();
  }

  getFeedbacksFromHelper() async
  {
    feedbacks = await feedbacksHelperHere!.getAllFeedbacks();
    notifyListeners();
  }

  String convertTimestampToString(Timestamp timestamp) {

    DateTime dateTime = timestamp.toDate();

    String formatPattern = "yyyy-MM-dd HH:mm:ss";

    DateFormat dateFormat = DateFormat(formatPattern);

    String formattedString = dateFormat.format(dateTime);

    return formattedString;
  }

  clearFeedbacks(){
    feedbacks.clear();
    notifyListeners();
  }

  deleteFeedback(String id) async{
    await feedbacksHelperHere!.deleteItem(id);
    getFeedbacksFromHelper();
    notifyListeners();
  }

}
