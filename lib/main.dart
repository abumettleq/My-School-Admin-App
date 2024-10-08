import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Provider/classes_excel_provider.dart';
import 'package:my_school_admin_app/Provider/classes_provider.dart';
import 'package:my_school_admin_app/Provider/feedbacks_provider.dart';
import 'package:my_school_admin_app/Provider/people_provider.dart';
import 'package:my_school_admin_app/Provider/student_excel_provider.dart';
import 'package:my_school_admin_app/Provider/teacher_excel_provider.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:my_school_admin_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
        ChangeNotifierProvider<StudentExcelProvider>(create: (context) => StudentExcelProvider()),
        ChangeNotifierProvider<TeacherExcelProvider>(create: (context) => TeacherExcelProvider()),
        ChangeNotifierProvider<FeedbacksProvider>(create: (context) => FeedbacksProvider()),
        ChangeNotifierProvider<ClassesExcelProvider>(create: (context) => ClassesExcelProvider()),
        ChangeNotifierProvider<PeopleProvider>(create: (context) => PeopleProvider()),
        ChangeNotifierProvider<ClassesProvider>(create: (context) => ClassesProvider()),
      ],
      child: const MyApp()  
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(1600, 1024),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp(
          navigatorKey: AppRouter.navKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: child,
          debugShowCheckedModeBanner: false,
        );
      },
      child: const LoginPage(),
      //child: const Dashboard(),
    );
  }
}
