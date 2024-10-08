import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/feedbacks_provider.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:provider/provider.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({super.key,required this.feedbackId});
  final String feedbackId;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 250.w,
        height: 130.h,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color(0xffffabdc).withOpacity(0.4),
          //     spreadRadius: 3,
          //     blurRadius: 6,
          //     offset: const Offset(5, 10), // changes position of shadow
          //   ),
          // ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Are you Sure?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color.fromARGB(255, 1, 29, 80),
                  ),
                  onPressed: (){
                    AppRouter.pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Consumer<FeedbacksProvider>(
                  builder: (context,feedbacksProvider,child) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 2, 28, 99),
                      ),
                      onPressed: (){
                        feedbacksProvider.deleteFeedback(feedbackId);
                        AppRouter.pop();
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    );
                  }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
