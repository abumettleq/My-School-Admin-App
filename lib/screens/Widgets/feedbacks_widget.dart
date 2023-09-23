import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/feedbacks_provider.dart';
import 'package:my_school_admin_app/screens/Widgets/confirm_widget.dart';
import 'package:provider/provider.dart';

class FeedbacksWidget extends StatefulWidget {
  const FeedbacksWidget({super.key});

  @override
  State<FeedbacksWidget> createState() => _FeedbacksWidgetState();
}

class _FeedbacksWidgetState extends State<FeedbacksWidget> {
  Widget loadingWidget = const Center(child: CircularProgressIndicator(color: Colors.grey,),);

  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 2),(){
      FeedbacksProvider feedbacksProvider = FeedbacksProvider();
      if(feedbacksProvider.feedbacks.isEmpty){
        setState(() {
          loadingWidget = Center(
            child: Text(
              "No Feedbacks Found!",
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
          );
        });
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbacksProvider>(
        builder: (context, feedbacksProvider, child) {
      return Container(
        width: 1290.w,
        height: 950.h,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Feedbacks",
                  style: TextStyle(color: Colors.black, fontSize: 24.sp),
                ),
                // this is refresh icon button
                IconButton(
                  onPressed: () async {
                    // Show the CircularProgressIndicator
                    setState(() {
                      feedbacksProvider.clearFeedbacks();
                    });
                    loadingWidget = const Center(child: CircularProgressIndicator(color: Colors.grey,),);

                    await feedbacksProvider.getFeedbacksFromHelper();
                    loadingWidget = Center(
                      child: Text(
                        "No Feedbacks Found!",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    );

                  },
                  icon: Icon(
                    Icons.refresh_rounded,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Spacer(),
            feedbacksProvider.feedbacks.isEmpty
              ? loadingWidget
              : SizedBox(
                height: 825.h,
                width: 1290.w,
                child: ListView.builder(
                    itemCount: feedbacksProvider.feedbacks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 1200.w,
                        //height: 210.h,
                        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color.fromRGBO(217, 217, 217, 1.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  feedbacksProvider.feedbacks[index].fullName!,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      showDialog(context: context, builder: (context){
                                        return ConfirmWidget(feedbackId: feedbacksProvider.feedbacks[index].id!,);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_outline_rounded,
                                      size: 24.sp,
                                      color: const Color.fromRGBO(147, 0, 0, 1.0),
                                    ))
                              ],
                            ),
                            Text(
                              feedbacksProvider.feedbacks[index].sidOrMobile!,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 94, 166, 254),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 1280.w,
                              //height: 90.h,
                              child: Text(
                                feedbacksProvider.feedbacks[index].comment!,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  feedbacksProvider.feedbacks[index].emailAddress!,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  feedbacksProvider.feedbacks[index].timestamp!,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            const Spacer(),
          ],
        ),
      );
    });
  }
}
