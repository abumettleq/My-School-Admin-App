import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/reports_provider.dart';
import 'package:my_school_admin_app/screens/Widgets/confirm_widget.dart';
import 'package:provider/provider.dart';

class ReportsWidget extends StatefulWidget {
  const ReportsWidget({super.key});

  @override
  State<ReportsWidget> createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  Widget loadingWidget = const Center(child: CircularProgressIndicator(color: Colors.grey,),);

  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 5),(){
      ReportsProvider reportsProvider = ReportsProvider();
      if(reportsProvider.reports.isEmpty){
        setState(() {
          loadingWidget = Center(
            child: Text(
              "No Reports Found!",
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
    return Consumer<ReportsProvider>(
        builder: (context, reportsProvider, child) {
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
                  "Reports",
                  style: TextStyle(color: Colors.black, fontSize: 24.sp),
                ),
                // this is refresh icon button
                IconButton(
                  onPressed: () async {
                    // Show the CircularProgressIndicator
                    setState(() {
                      reportsProvider.clearReports();
                    });
                    loadingWidget = const Center(child: CircularProgressIndicator(color: Colors.grey,),);
                    // Wait for 5 seconds
                    //await Future.delayed(const Duration(seconds: 5));
                    await reportsProvider.getReportsFromHelper();
                    loadingWidget = Center(
                      child: Text(
                        "No Reports Found!",
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
            reportsProvider.reports.isEmpty
              ? loadingWidget
              : SizedBox(
                height: 825.h,
                width: 1290.w,
                child: ListView.builder(
                    itemCount: reportsProvider.reports.length,
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
                                  reportsProvider.reports[index].fullName!,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      showDialog(context: context, builder: (context){
                                        return ConfirmWidget(reportId: reportsProvider.reports[index].id!,);
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
                              reportsProvider.reports[index].sidOrMobile!,
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
                                reportsProvider.reports[index].comment!,
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
                                  reportsProvider.reports[index].emailAddress!,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  reportsProvider.reports[index].timestamp!,
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
