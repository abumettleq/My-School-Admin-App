import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1220.w,
      height: 925.h,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "People",
            style: TextStyle(
              color: Colors.black,fontSize: 26.sp
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            width: 500.w,
            height: 420.h,
            padding: EdgeInsets.all(25.w),
            decoration: BoxDecoration(
              color:const Color.fromRGBO(217, 217, 217, 1.0),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Students",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.sp
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.people_alt_outlined,size: 40.sp,),
                    SizedBox(width: 10.w,),
                    Text(
                      "2596",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.sp
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.white
                      ),
                      child: Icon(Icons.bar_chart_rounded,size: 32.sp,color:const Color.fromRGBO(150, 101, 255, 1.0),),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      "11%",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.sp
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:const StadiumBorder(),
                      backgroundColor: const Color.fromRGBO(142, 90, 252, 1.0),
                      foregroundColor:  const Color.fromRGBO(255, 255, 255, 0.5),
                      padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 15.h)
                    ),
                    onPressed: (){

                    },
                    child: Text(
                      "Upload New Students",
                      style: TextStyle(
                          color:Colors.black,
                          fontSize: 32.sp
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
