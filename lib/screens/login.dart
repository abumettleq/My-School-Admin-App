import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context,userProvider,child) {
          return Stack(
            children: [
              Container(
                width: 1600.w,
                height: 1024.h,
                alignment: Alignment.topRight,
                decoration: const BoxDecoration(
                  color: Color(0xffffabdc),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Color(0xffffabdc),
                  //     Color(0xfffcbde2),
                  //     Color(0xffffd1ec),
                  //     Color(0xfffcd9ec)
                  //   ],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  // ),
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
              Form(
                key: userProvider.loginKey,
                child: AutofillGroup(
                  child: SizedBox(
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
                                  validator: userProvider.userIDValidator,
                                  controller: userProvider.userIDController,
                                  autofillHints: const [AutofillHints.name],
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: TextStyle(
                                          color: const Color.fromRGBO(142, 4, 103, 1),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500
                                      ),
                                      hintText: 'Enter your Username',
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
                              SizedBox(height: 30.h,),
                              SizedBox(
                                width: 480.w,
                                height: 80.h,
                                child: TextFormField(
                                  validator: userProvider.passwordValidator,
                                  controller: userProvider.passwordController,
                                  keyboardType: TextInputType.text,
                                  autofillHints: const [AutofillHints.password],
                                  textInputAction: TextInputAction.done,
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
                              // ElevatedButton(
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: const Color.fromRGBO(142, 4, 103, 1),
                              //     shape: const StadiumBorder(),
                              //     foregroundColor: const Color.fromRGBO(255, 216, 239, 0.7)
                              //   ),
                              //     onPressed: () {
                              //       userProvider.login();
                              //     },
                              //     child: Padding(
                              //       padding: EdgeInsets.symmetric(horizontal: 100.w,vertical: 15.h),
                              //       child: Text(
                              //           "LOGIN",
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: 26.sp,
                              //             fontWeight: FontWeight.bold,
                              //         ),
                              //       ),
                              //     )
                              // )
                              RoundedLoadingButton(
                                  successColor: Colors.green,
                                  loaderStrokeWidth: 4,
                                  loaderSize: 34.w,
                                  borderRadius: 40.r,
                                  color: const Color.fromRGBO(142, 4, 103, 1),
                                  valueColor: Colors.white,
                                  height: 72.h,
                                  width: 340.w,
                                  controller: userProvider.btnController,
                                  onPressed: (){userProvider.login();},
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.bold,
                                    ),
                                  ),
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

                  ),
                ),
              )

            ],
          );
        }
      ),
    );
  }
}
