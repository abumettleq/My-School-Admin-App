import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1600.w,
            height: 1024.h,
            alignment: Alignment.topRight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFffd8ef), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'rectangle-1.png',
                  width: 694.59.w,
                  height: 1024.h,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1600.w,
            height: 1024.h,
            child: Row(
              children: [
                SizedBox(
                  width: 700.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("avatar.png",width: 128.h,height: 128.h,fit: BoxFit.cover,),
                      SizedBox(height: 30.h,),
                      Text(
                        "WELCOME",
                        style: TextStyle(
                          color:const Color.fromRGBO(142, 4, 103, 1.0),
                          fontSize: 72.sp,
                          fontFamily: 'risque'
                        ),
                      ),
                      SizedBox(height: 40.h,),
                      SizedBox(
                        width: 480.w,
                        height: 80.h,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              labelText: 'User Name',
                              labelStyle: TextStyle(
                                  color: const Color.fromRGBO(142, 4, 103, 1),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500
                              ),
                              hintText: 'Enter your User Name',
                              hintStyle:TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                              fillColor: const Color.fromRGBO(255, 216, 239, 0.7),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromRGBO(142, 4, 103, 1)
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromRGBO(142, 4, 103, 1),
                                    width: 1.5
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              border: OutlineInputBorder(
                                borderSide:const BorderSide(
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h,),
                      SizedBox(
                        width: 480.w,
                        height: 80.h,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: const Color.fromRGBO(142, 4, 103, 1),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500
                              ),
                              hintText: 'Enter your Password',
                              hintStyle:TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                              fillColor: const Color.fromRGBO(255, 216, 239, 0.7),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromRGBO(142, 4, 103, 1)
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromRGBO(142, 4, 103, 1),
                                    width: 1.5
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              border: OutlineInputBorder(
                                borderSide:const BorderSide(
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(142, 4, 103, 1),
                          shape: const StadiumBorder(),
                          foregroundColor: const Color.fromRGBO(255, 216, 239, 0.7)
                        ),
                          onPressed: (){},
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 15.h),
                            child: Text(
                                "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 500.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("lampshade.png",width: 174.w,height: 276.h,),
                        ],
                      ),
                      SizedBox(height: 41.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("rectangle.png",width: 380.w,height: 411.h,),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),

              ],
            ),

          )

        ],
      ),
    );
  }
}
