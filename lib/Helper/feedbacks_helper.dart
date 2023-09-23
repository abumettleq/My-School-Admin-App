import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/feedbacks_model.dart';
import 'package:my_school_admin_app/Router/app_router.dart';

class FeedbackHelper {
  FeedbackHelper._();
  static FeedbackHelper feedbacksHelper = FeedbackHelper._();

  CollectionReference<Map<String, dynamic>>? colReference =
      FirebaseFirestore.instance.collection('feedback');

  Future<List<FeedbacksModel>> getAllFeedbacks() async {
    try {
      QuerySnapshot querySnapshot = await colReference!.get();
      List<FeedbacksModel> feedbacks = [];

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        FeedbacksModel feedback = FeedbacksModel.fromMap(data, document.id);
        feedbacks.add(feedback);
      }
      return feedbacks;

    } catch (e) {
      debugPrint('Error getting feedbacks: $e');
      rethrow;
    }
  }

  Future<void> deleteItem(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection('feedbacks').doc(documentId).delete();
      AppRouter.showSnackBar("Deleted", "feedback deleted successfully.");
    } catch (e) {
      AppRouter.showErrorSnackBar("Failed", "Error deleting item, try again!");

    }
  }
}
