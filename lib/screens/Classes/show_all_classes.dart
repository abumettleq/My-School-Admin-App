import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_school_admin_app/Model/class_model.dart';
import 'package:my_school_admin_app/Provider/classes_provider.dart';
import 'package:my_school_admin_app/Router/app_router.dart';
import 'package:my_school_admin_app/screens/Classes/notify_students_by_class.dart';
import 'package:my_school_admin_app/screens/Classes/show_students_by_class.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ShowAllClasses extends StatelessWidget {
  const ShowAllClasses({super.key});

  @override
  Widget build(BuildContext context) {
    List<ClassModel> searchedClasses = [];
    return Consumer<ClassesProvider>(
        builder: (context, classesProvider, child) {
      return Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300.w,
                child: Row(
                  children: [
                    const Spacer(),
                    IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          classesProvider.searchClassesController.clear();
                          AppRouter.pop();
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.black,
                          size: 24.sp,
                        )),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: SearchBar(
                    hintText: "Search a class...",
                    controller: classesProvider.searchClassesController,
                    onChanged: (value) {
                      searchedClasses = classesProvider.searchClasses(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 1250.w,
                  height: 960.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(192, 192, 192, 1.0),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.r),
                                topLeft: Radius.circular(16.r))),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200.w,
                              //height: 40.h,
                              child: Text(
                                "Class Id",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(
                              width: 200.w,
                              //height: 40.h,
                              child: Text(
                                "Class Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(
                              width: 200.w,
                              //height: 40.h,
                              child: Text(
                                "Class Section",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              //height: 40.h,
                              child: Text(
                                "Record",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.h,
                        height: 0,
                        color: Colors.black,
                      ),
                      SizedBox(
                          width: 1250.w,
                          height: MediaQuery.of(context).size.height - 115,
                          child: classesProvider.isClassesDataLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.grey,
                                  ),
                                )
                              : classesProvider.classesData.isEmpty
                                  ? const Center(
                                      child: Text("No class data fetched."),
                                    )
                                  : classesProvider.searchClassesController.text
                                          .isNotEmpty
                                      ? searchedClasses.isEmpty
                                          ? const Center(
                                              child: Text("No classes found."),
                                            )
                                          : createListView(searchedClasses)
                                      : createListView(
                                          classesProvider.classesData)),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      );
    });
  }

  Widget createListView(List<ClassModel> classesData) {
    return ListView.builder(
        itemCount: classesData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                color: index % 2 == 0
                    ? Colors.white
                    : const Color.fromRGBO(243, 194, 252, 1.0),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      //height: 60.h,
                      child: Text(
                        classesData[index].id,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      //height: 60.h,
                      child: Text(
                        classesData[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      //height: 60.h,
                      child: Text(
                        classesData[index].section,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.w,
                      //height: 40.h,
                      child: Consumer<ClassesProvider>(
                          builder: (context, classesProvider, child) {
                        return Row(
                          children: [
                            IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 212, 212),
                                ),
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const ShowStudentsByClass();
                                      });
                                  classesProvider.clearStudentsData();
                                  await classesProvider
                                      .getStudentData(classesData[index].id);
                                },
                                icon: Icon(
                                  Icons.view_list_outlined,
                                  color: Colors.blueAccent,
                                  size: 24.sp,
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 212, 212),
                                ),
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('System'),
                                          content: Text(
                                              "Are you sure you want to clear class '${classesData[index].id}'?"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  AppRouter.pop(),
                                              child: const Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await classesProvider
                                                    .clearStudentsFromClass(
                                                        classesData[index].id);
                                                AppRouter.pop();
                                              },
                                              child: const Text('Yes'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.group_remove_outlined,
                                  color: Colors.redAccent,
                                  size: 24.sp,
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 212, 212),
                                ),
                                onPressed: () {
                                  AppRouter.pushToWidget(NotifyStudentsByClass(
                                      classId: classesData[index].id));
                                },
                                icon: Icon(
                                  Icons.notification_add,
                                  color: Colors.green,
                                  size: 24.sp,
                                )),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.h,
                height: 0,
                color: Colors.black,
              ),
            ],
          );
        });
  }
}
