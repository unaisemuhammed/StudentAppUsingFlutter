import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentapp2/controller/add_student_page_controller.dart';
import 'package:studentapp2/db/handler.class.dart';
import 'package:studentapp2/db/model_class.dart';
import 'package:studentapp2/screens/update_students.dart';

import 'add_student_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(StudentController());
    StudentHandler handler = Get.put(StudentHandler());
    final double heightScreen = MediaQuery.of(context).size.height;
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
                  init: StudentController(),
                  builder: (controller) {
                    return FutureBuilder(
                      future: handler.retrieveStudentList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<StudentsModel>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFebebeb),
                                  child: ListTile(
                                    onTap: () {
                                      var indexer=snapshot.data![index];
                                      studentController.updateControllAssigning(indexer);
                                      Get.to(UpdateStudent(
                                          students: snapshot.data![index]));
                                    },
                                    contentPadding:
                                    const EdgeInsets.only(left: 5),
                                    // onTap: () =>
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
                                      'Class:${snapshot.data![index].studentClass}, Age:${snapshot.data![index].studentAge}\nPhone:${snapshot.data![index].studentGender}\nAddress:${snapshot.data![index].studentAddress}',
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
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
                                          PopupMenuItem(
                                            child: const Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onTap: () {
                                              handler.deleteStudent(snapshot
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            studentController.nameController.clear();
            studentController.classController.clear();
            studentController.ageController.clear();
            studentController.addressController.clear();
            studentController.numberController.clear();
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
