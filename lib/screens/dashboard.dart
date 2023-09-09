import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:my_school_admin_app/screens/Widgets/adminstration_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/calendar_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/help_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/people_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/projects_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/reports_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/timesheet_widget.dart';
import 'package:my_school_admin_app/screens/Widgets/training_widget.dart';
import 'package:provider/provider.dart';

import 'Widgets/dashboard_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIdx = 0;

  Map<int, dynamic> items = {
    0: [Icons.dashboard, "Dashboard", const DashboardWidget()],
    1: [Icons.people, "People", const PeopleWidget()],
    2: [Icons.paste_rounded, "Projects", const ProjectsWidget()],
    3: [Icons.calendar_today_rounded, "Calender", const CalendarWidget()],
    4: [Icons.live_tv_rounded, "Training", const TrainingWidget()],
    5: [Icons.access_time_rounded, "Timesheet", const TimesheetWidget()],
    6: [Icons.messenger_rounded, "Reports", const ReportsWidget()],
    7: [
      Icons.home_work_rounded,
      "Administration",
      const AdministrationWidget()
    ],
    8: [Icons.help_outline_rounded, "Help", const HelpWidget()]
  };

  Widget currentWidget = const DashboardWidget();

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
                      InkWell(
                        child: Stack(
                          children: [
                            Image.asset(
                            "assets/avatar.png", // Replace with your image path
                            width: 50.0.w,
                            height: 50.0.w,
                            fit: BoxFit.cover,
                          ),
                          if(userProvider.canShowContainer)
                                  Container(
                                    color: Colors.red,
                                    margin: EdgeInsets.only(top: 50.h),
                                    child:
                                    const Text("dsad"),
                                  )

                        ]
                    ),
                        onTap: (){
                            userProvider.toggleContainer();

                        },
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Abu Mettleq",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 1300.w,
                        height: 64.h,
                        color: Colors.white,
                        child: TextField(
                          cursorColor: const Color(0xffffabdc),
                          decoration: InputDecoration(
                            hoverColor: Colors.white,
                            suffixIcon: Icon(
                              Icons.notifications,
                              color: Colors.blue,
                              size: 24.sp,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 24.sp,
                              color: Colors.blue,
                            ),
                            hintText: 'Quick Search',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
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
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            width: 350.w,
                            height: 670.h,
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
                                            vertical: 30.h, horizontal: 10.w),
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
                                          size: 30.sp,
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
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "School Dashboard",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20.sp),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Version 1.0.0",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 17.sp),
                                )
                              ],
                            ),
                          ),
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
