import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FeedbacksModel
{
  String? id;
  String? comment;
  String? emailAddress;
  String? fullName;
  String? sidOrMobile;
  String? timestamp;

  FeedbacksModel(
    {
      this.id,
      this.comment,
      this.emailAddress,
      this.fullName,
      this.sidOrMobile,
      this.timestamp,
    }
  );

  FeedbacksModel.fromMap(Map<String,dynamic> map, String documentId){
    id = documentId;
    comment =  map['comment'];
    emailAddress = map['emailAddress'];
    fullName = map['fullName'];
    sidOrMobile = map['sidOrMobile'];
    timestamp = convertTimestampToString(map['timestamp']);
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'comment': comment,
      'emailAddress': emailAddress,
      'fullName': fullName,
      'sidOrMobile': sidOrMobile,
      'timestamp': timestamp,
    };
  }

  String convertTimestampToString(Timestamp timestamp)
  {
      DateTime dateTime = timestamp.toDate();

      // Define a format pattern (e.g., "yyyy-MM-dd HH:mm:ss")
      String formatPattern = "yyyy-MM-dd HH:mm:ss";

      // Create a DateFormat object with the desired format pattern
      DateFormat dateFormat = DateFormat(formatPattern);

      // Format the DateTime as a string
      String formattedString = dateFormat.format(dateTime);

      return formattedString;
  }

}