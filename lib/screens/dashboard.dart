import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
        ],
      ),
    );
  }
}