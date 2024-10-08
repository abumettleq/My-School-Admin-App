import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });

    return Scaffold(
      body: Consumer<UserProvider>(builder: (context, userProvider, child) {
        return Stack(
          children: [
          Container(
  width: 1600.w,
  height: 1024.h,
  alignment: Alignment.topRight,
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('schooback.jpg'), 
      fit: BoxFit.cover,
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Image.asset(
        'assets/rectangle-1.png',
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
                            Image.asset(
                              "avatar.png",
                              width: 128.h,
                              height: 128.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "WELCOME",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 21, 62),
                                  fontSize: 72.sp,
                                  fontFamily: 'risque'),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
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
                                        color: Color.fromARGB(255, 0, 21, 62),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                    hintText: 'Enter your Username',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    fillColor: const Color.fromRGBO(
                                        255, 216, 239, 0.7),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          style: BorderStyle.solid,
                                          color:
                                              Color.fromARGB(255, 0, 21, 62)),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          style: BorderStyle.solid,
                                          color: Color.fromARGB(255, 0, 21, 62),
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(16.r),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
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
                                        color: const Color.fromARGB(255, 0, 21, 62),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                    hintText: 'Enter your Password',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    fillColor: const Color.fromRGBO(
                                        255, 216, 239, 0.7),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          style: BorderStyle.solid,
                                          color:
                                              Color.fromARGB(255, 0, 21, 62)),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          style: BorderStyle.solid,
                                          color: Color.fromARGB(255, 0, 21, 62),
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(16.r),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            RawKeyboardListener(
                              focusNode: focusNode,
                              onKey: (RawKeyEvent event) {
                                if (event is RawKeyDownEvent &&
                                    event.logicalKey ==
                                        LogicalKeyboardKey.enter) {
                                  userProvider.btnController.start();
                                  userProvider.login();
                                  userProvider.getAdminProfile();
                                }
                              },
                              child: RoundedLoadingButton(
                                successColor: Colors.green,
                                loaderStrokeWidth: 4,
                                loaderSize: 34.w,
                                borderRadius: 40.r,
                                color: const Color.fromARGB(255, 0, 21, 62),
                                valueColor: Colors.white,
                                height: 72.h,
                                width: 340.w,
                                controller: userProvider.btnController,
                                onPressed: () {
                                  userProvider.login();
                                  userProvider.getAdminProfile();
                                },
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 700.w,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "lampshade.png",
                                  width: 174.w,
                                  height: 276.h,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "rectangle.png",
                                  width: 550.w,
                                  height: 700.h,
                                ),
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
      }),
    );
  }
}
