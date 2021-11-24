import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentapp2/controller/add_student_page_controller.dart';
import 'package:studentapp2/controller/drop_down.dart';
import 'package:studentapp2/db/handler.class.dart';
import 'package:studentapp2/db/model_class.dart';
import 'package:studentapp2/screens/update_student.dart';

import 'add_student_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentHandler handler = Get.put(StudentHandler());
    StudentController studentController = Get.put(StudentController());
    // DropDownController dropDownController = Get.put(DropDownController());
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: Colors.transparent,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  children: [
                    Image.asset(
                      'assets/images/41JFdwRTBKL.png',
                      color: Colors.blue,
                      scale: 15,
                    ),
                    Text('Students',
                        style: GoogleFonts.orbitron(
                            fontSize: 25, color: Colors.black)),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15, right: 10, left: 10, bottom: 50),
                height: heightScreen,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),

                child: GetBuilder<StudentController>(
                  // init: StudentController(),
                  builder: (controller) {
                    return FutureBuilder(
                      future: handler.retrieveStudentList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<StudentsModel>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              // var name=snapshot.data![index].studentName;
                              // var sClass=snapshot.data![index].studentClass;
                              // var age=snapshot.data![index].studentAge;
                              // var gender=snapshot.data![index].studentGender;
                              // var address=snapshot.data![index].studentName;
                              // int? id =snapshot.data![index].id;
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFebebeb),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.only(left: 5),
                                    // onTap: ()=>Get.to( UpdateStudent(studentsModel:snapshot.data![index])),
                                    leading: const CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.person,
                                        size: 45,
                                      ),
                                    ),
                                    title: Text(
                                      snapshot.data![index].studentName,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 22),
                                    ),
                                    subtitle: Text(
                                      'Class:${snapshot.data![index].studentClass}, Age:${snapshot.data![index].studentAge}\Phone:${snapshot.data![index].studentGender}\nAddress:${snapshot.data![index].studentAddress}',
                                      style: const TextStyle(fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    trailing: PopupMenuButton(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.grey,
                                        ),
                                        color: const Color(0xFF191A33),
                                        itemBuilder: (context) => [
                                              // PopupMenuItem(
                                              //   child: Text(
                                              //     "Delete",
                                              //     style:
                                              //  TextStyle(color: Colors.white)
                                              //   ),
                                              //   value: 1,
                                              // ),
                                              PopupMenuItem(
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onTap: () {
                                                  handler.deleteStudent(
                                                      snapshot
                                                          .data![index].id!);
                                                  controller.update();
                                                },
                                                value: 1,
                                              ),
                                            ]),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // Stack(
        //   children: [
        //     Positioned(child: Row(
        //       children: [
        //
        //       ],
        //     )),
        //     Positioned(
        //       child: FutureBuilder(
        //           builder: (BuildContext context, AsyncSnapshot<dynamic> snapShot) {
        //         return ListView.builder(
        //           itemCount: 20,
        //             itemBuilder: (BuildContext context, int index) {
        //           return const ListTile(
        //             leading: Icon(Icons.add),
        //           );
        //         });
        //       }),
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddStudent());
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: const Color(0xFF3B2B48),
        ),
      ),
    );
  }
}
