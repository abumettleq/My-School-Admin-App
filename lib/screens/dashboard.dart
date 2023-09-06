import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widgets/dashboard_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIdx = 0;

  Map<int,dynamic> items = {
    0: [
      Icons.dashboard,
      "Dashboard",
      const DashboardWidget()
    ],
    1: [
      Icons.people,
      "People",
      const Placeholder()
    ],
    2: [
      Icons.paste_rounded,
      "Projects",
      const Placeholder()
    ],
    3: [
      Icons.calendar_today_rounded,
      "Calender",
      const Placeholder()
    ],
    4: [
      Icons.live_tv_rounded,
      "Training",
      const Placeholder()
    ],
    5: [
      Icons.access_time_rounded,
      "Timesheet",
      const Placeholder()
    ],
    6: [
      Icons.messenger_rounded,
      "Reports",
      const Placeholder()
    ],
    7: [
      Icons.home_work_rounded,
      "Administration",
      const Placeholder()
    ],
    8: [
      Icons.help_outline_rounded,
      "Help",
      const Placeholder()
    ]
  };

  Widget currentWidget = const DashboardWidget();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:const Color(0xffffabdc),
      body: Column(
        children: [
          Container(
            width: 1600.w,
            height: 64.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.r),bottomLeft: Radius.circular(16.r))
            ),
            child: Row(
              children: [
                Image.asset("avatar.png",width: 50.h,height: 50.h,fit: BoxFit.cover,),
                SizedBox(width: 10.w,),
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
                      suffixIcon: Icon(Icons.notifications,color: Colors.blue,size: 24.sp,),
                      prefixIcon: Icon(Icons.search,size: 24.sp,color: Colors.blue,),
                        hintText: 'Quick Search',
                        hintStyle:TextStyle(
                            color: Colors.grey,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                        fillColor: Colors.white,
                        filled: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide:BorderSide(
                            style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:BorderSide(
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
                              backgroundColor: selectedIdx == index ? const Color.fromRGBO(220, 233, 252, 1.0) : Colors.white,
                              foregroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 10.w),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))
                            ),
                            onPressed: (){
                              setState(() {
                                selectedIdx = index;
                                currentWidget = items[index][2];
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  items[index][0],
                                  color: selectedIdx == index ? Colors.blue : Colors.grey,
                                  size: 30.sp,
                                ),
                                SizedBox(width: 20.w,),
                                Text(
                                  items[index][1],
                                  style: TextStyle(
                                    color: selectedIdx == index ? Colors.blue : Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            )
                          );
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
                              fontSize: 20.sp
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            "Version 1.0.0",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontSize: 17.sp
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w,),
                currentWidget
              ],
            ),
          )
        ],
      ),
    );
  }
}