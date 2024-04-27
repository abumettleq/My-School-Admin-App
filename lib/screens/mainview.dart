import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:my_school_admin_app/screens/Widgets/adminstration_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/calendar_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/help_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/people_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/projects_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/feedbacks_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/timesheet_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/training_widget.dart';
import 'package:my_school_admin_app/screens/login.dart';
import 'package:provider/provider.dart';

import 'Widgets/dashboard_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIdx = 0;

  Map<int, dynamic> items = {
    0: [Icons.dashboard, "Dashboard", const DashboardWidget()],
    1: [Icons.people, "People", const PeopleWidget()],
    2: [Icons.paste_rounded, "Attendance", const ProjectsWidget()],
    3: [Icons.calendar_today_rounded, "Calender", const CalendarWidget()],
    4: [Icons.live_tv_rounded, "Training", const TrainingWidget()],
    5: [Icons.access_time_rounded, "Timesheet", const TimesheetWidget()],
    6: [Icons.messenger_rounded, "Feedbacks", const FeedbacksWidget()],
    7: [Icons.home_work_rounded, "Administration", const AdministrationWidget()],
    8: [Icons.help_outline_rounded, "Help", const HelpWidget()]
  };

  Widget currentWidget = const DashboardWidget();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // UserProvider userProvider = UserProvider();
    // userProvider.getAdminProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context,userProvider,child) {
        return Scaffold(
          backgroundColor: const Color(0xffffabdc),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 1600.w,
                  height: 64.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.r),
                          bottomLeft: Radius.circular(16.r))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                        height: 50.w,
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundImage: NetworkImage(userProvider.adminDetails[0].imageUrl ?? "assets/avatar.png",),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                           userProvider.adminDetails[0].name ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 1600.w,
                  height: 925.h,
                  color: Colors.transparent,
                  margin: EdgeInsets.all(10.sp),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            width: 280.w,
                            height: 450.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: selectedIdx == index
                                            ? const Color.fromRGBO(220, 233, 252, 1.0)
                                            : Colors.white,
                                        foregroundColor: Colors.blue,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h, horizontal: 10.w),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.r))),
                                    onPressed: () {
                                      setState(() {
                                        selectedIdx = index;
                                        currentWidget = items[index][2];
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          items[index][0],
                                          color: selectedIdx == index
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 24.sp,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Text(
                                          items[index][1],
                                          style: TextStyle(
                                              color: selectedIdx == index
                                                  ? Colors.blue
                                                  : Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ),
                          const Spacer(),

                          Container(
                            width: 280.w,
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 50.w,
                              height: 50.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor:  const Color(0xffffabdc),
                                  shape:const StadiumBorder(),
                                  fixedSize: Size(40.w, 50.w),
                                  alignment: Alignment.center,
                                  padding:const EdgeInsets.all(0),
                                ),
                                onPressed: (){
                                  AppRouter.pushWithReplacementToWidget(const LoginPage());
                                },
                                child: Icon(Icons.logout_rounded,size: 24.sp,color: Colors.black,)
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      currentWidget
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
